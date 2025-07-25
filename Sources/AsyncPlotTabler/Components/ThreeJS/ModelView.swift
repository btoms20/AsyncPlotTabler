//
//  ModelView.swift
//  PlotTabler
//

import Plot
import Foundation

public struct ModelView:Component {
    @EnvironmentValue(.dependencies) var deps
    
    public struct LightOptions:Codable {
        let directionalLightIntisity:Double
        
        public init(directionalLightIntisity: Double = 1.0) {
            self.directionalLightIntisity = directionalLightIntisity
        }
    }
    
    public struct ZoomOptions:Codable {
        let enabled:Bool
        
        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }
    
    /// Wether the 3D Model should rotate automatically
    public struct AnimationsOptions:Codable {
        /// Wether the 3D Model should rotate automatically
        public enum Option:Codable {
            case disabled
            /// The default speed is 0.005
            case enabled(speed:Double)
        }
        let type:Option
        
        /// Wether the 3D Model should rotate automatically (and at what speed)
        public init(_ option:Option) {
            self.type = option
        }
        
        var enabled:Bool {
            switch self.type {
            case .disabled: return false
            case .enabled: return true
            }
        }
        
        var speed:Double {
            switch self.type {
            case .disabled: return 0.0
            case .enabled(let speed): return speed
            }
        }
    }
    
    public struct Options:Codable {
        let height: Int
        let offset:Double
        let zoom: ZoomOptions
        let animations:AnimationsOptions
        let light:LightOptions
        
        public init(minHeight: Int = 300, offset:Double = 1.0, zoom: ZoomOptions = .init(enabled: false), animations: AnimationsOptions = .init(.enabled(speed: 0.005)), lightIntisity:Double = 3.0) {
            self.height = minHeight
            self.offset = offset
            self.zoom = zoom
            self.animations = animations
            self.light = .init(directionalLightIntisity: max(0.0, lightIntisity))
        }
    }
   
    public enum Loader {
        case gltf(String)
        
        var loaderImport:String {
            switch self {
            case .gltf:
                "import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js'"
            }
        }
        
        var loaderInstantiation:String {
            switch self {
            case .gltf:
                "new GLTFLoader()"
            }
        }
        
        var path:String {
            switch self {
            case .gltf(let p):
                return p
            }
        }
    }
    
    let uuid:UUID
    let loader:Loader
    let options:ModelView.Options
    
    public init(uuid:UUID = UUID(), load loader:Loader, options:ModelView.Options = .init()) {
        self.uuid = uuid
        self.loader = loader
        self.options = options
    }
    
    public func body() async -> Component {
        // Include our JS Library
        //deps.addJSSource("/libs/threejs/three.module.js")
        //deps.addJSSource("/libs/threejs/OrbitControls.js")
        //deps.addJSSource("/libs/threejs/GLTFLoader.js")
        //deps.addJSSource("/libs/threejs/BufferGeometryUtils.js")
        
        let version = "0.178.0"
        
        // Inject Module Map
        let importMap = """
        {
          "imports": {
            "three": "https://cdn.jsdelivr.net/npm/three@0.167.0/build/three.module.js",
            "three/addons/": "https://cdn.jsdelivr.net/npm/three@0.167.0/examples/jsm/"
          }
        }
        """
        deps.addRawScript(importMap, as: .importMap)
        
        // Inject our component specific script
        deps.addRawScript(buildScript(), as: .module)
        
        // Return the component
        return Div { }
            .id("model-\(uuid.uuidString)")
            .style("min-height: \(options.height)px;")
    }
    
    func buildScript() -> String {
        
        let containerID = "cont\(self.uuid.uuidString.prefix(5))"
        
        let script = """
        
        import * as THREE from 'three';
        import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
        \(loader.loaderImport);
        
        const \(containerID) = document.getElementById("model-\(self.uuid.uuidString)");
        
        const scene = new THREE.Scene();
        const camera = new THREE.PerspectiveCamera( 75, \(containerID).clientWidth / \(containerID).clientHeight, 0.1, 1000 );
        camera.position.set(0, 0, 0.5);
        
        const renderer = new THREE.WebGLRenderer({ alpha: true });
        renderer.setSize( \(containerID).clientWidth, \(containerID).clientHeight );
        renderer.setAnimationLoop( animate );
        \(containerID).appendChild( renderer.domElement );
        
        const controls = new OrbitControls( camera, renderer.domElement );
        controls.maxPolarAngle = Math.PI / 2.8;
        controls.minPolarAngle = Math.PI / 8;
        controls.minDistance = 0.4;
        controls.maxDistance = 0.5;

        const light = new THREE.HemisphereLight()
        scene.add( light );
        
        const light2 = new THREE.DirectionalLight( 0xffffff, \(options.light.directionalLightIntisity) );
        light2.position.set(0, 0, 0.5);
        scene.add( light2 );

        const loader = \(loader.loaderInstantiation);

        let model;
        loader.load( '\(loader.path)', function ( object ) {
            model = object;
            scene.add( model.scene );
            fitCameraToCenteredObject(camera, model.scene, \(options.offset), controls)
        }, undefined, function ( error ) {
            console.error( error );
        } );

        function animate() {
            \(options.animations.enabled ? "if (model) { model.scene.rotation.y += \(options.animations.speed); }" : "")
            controls.update();
            light2.position.copy( camera.position );
            renderer.render( scene, camera );
        }
        
        window.addEventListener( 'resize', onWindowResize, false );

        function onWindowResize(){
            camera.aspect = \(containerID).clientWidth / \(containerID).clientHeight;
            camera.updateProjectionMatrix();
            renderer.setSize( \(containerID).clientWidth, \(containerID).clientHeight );
        }
        
        // https://wejn.org/2020/12/cracking-the-threejs-object-fitting-nut/
        const fitCameraToCenteredObject = function (camera, object, offset, orbitControls ) {
            const boundingBox = new THREE.Box3();
            boundingBox.setFromObject( object );

            var middle = new THREE.Vector3();
            var size = new THREE.Vector3();
            boundingBox.getSize(size);

            // figure out how to fit the box in the view:
            // 1. figure out horizontal FOV (on non-1.0 aspects)
            // 2. figure out distance from the object in X and Y planes
            // 3. select the max distance (to fit both sides in)
            //
            // The reason is as follows:
            //
            // Imagine a bounding box (BB) is centered at (0,0,0).
            // Camera has vertical FOV (camera.fov) and horizontal FOV
            // (camera.fov scaled by aspect, see fovh below)
            //
            // Therefore if you want to put the entire object into the field of view,
            // you have to compute the distance as: z/2 (half of Z size of the BB
            // protruding towards us) plus for both X and Y size of BB you have to
            // figure out the distance created by the appropriate FOV.
            //
            // The FOV is always a triangle:
            //
            //  (size/2)
            // +--------+
            // |       /
            // |      /
            // |     /
            // | F° /
            // |   /
            // |  /
            // | /
            // |/
            //
            // F° is half of respective FOV, so to compute the distance (the length
            // of the straight line) one has to: `size/2 / Math.tan(F)`.
            //
            // FTR, from https://threejs.org/docs/#api/en/cameras/PerspectiveCamera
            // the camera.fov is the vertical FOV.

            const fov = camera.fov * ( Math.PI / 180 );
            const fovh = 2*Math.atan(Math.tan(fov/2) * camera.aspect);
            let dx = size.z / 2 + Math.abs( size.x / 2 / Math.tan( fovh / 2 ) );
            let dy = size.z / 2 + Math.abs( size.y / 2 / Math.tan( fov / 2 ) );
            let cameraZ = Math.max(dx, dy);

            // offset the camera, if desired (to avoid filling the whole canvas)
            if( offset !== undefined && offset !== 0 ) cameraZ *= offset;

            camera.position.set( 0, 0, cameraZ );

            // set the far plane of the camera so that it easily encompasses the whole object
            const minZ = boundingBox.min.z;
            const cameraToFarEdge = ( minZ < 0 ) ? -minZ + cameraZ : cameraZ - minZ;

            camera.far = cameraToFarEdge * 3;
            camera.updateProjectionMatrix();

            if ( orbitControls !== undefined ) {
                // set camera to rotate around the center
                orbitControls.target = new THREE.Vector3(0, size.y * 0.4, 0);

                // prevent camera from zooming out far enough to create far plane cutoff
                orbitControls.maxDistance = cameraToFarEdge * offset * \(options.zoom.enabled ? "1.2" : "1.0");
                orbitControls.minDistance = cameraToFarEdge * offset * \(options.zoom.enabled ? "0.8" : "1.0");
            }
        };
        
        """
        
        return script
    }
}
