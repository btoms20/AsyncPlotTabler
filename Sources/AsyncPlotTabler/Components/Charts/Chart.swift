//
//  Chart.swift
//  PlotTabler
//

import Plot
import Foundation

public struct Chart:Component {
    @EnvironmentValue(.dependencies) var deps
    
    public enum ChartType:String {
        case line
        case area
        case bar
    }
    
    public struct DataSeries:Codable {
        
        public enum DataFormat:Codable {
            case double([Double])
            case optionalDouble([Double?])
            case int([Int])
            case optionalInt([Int?])
            case pairs([Pair])
            case optionalPairs([Pair?])
            
            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .double(let val):
                    try container.encode(val)
                case .optionalDouble(let val):
                    try container.encode(val)
                case .int(let val):
                    try container.encode(val)
                case .optionalInt(let val):
                    try container.encode(val)
                case .pairs(let val):
                    try container.encode(val)
                case .optionalPairs(let val):
                    try container.encode(val)
                }
            }
            
            var isNumeric:Bool {
                switch self {
                case .pairs, .optionalPairs:
                    return true
                default:
                    return false
                }
            }
        }
        
        let name:String
        let color:String?
        let data:DataFormat
        
        public init(name: String, color: Colors? = nil, data: [Double]) {
            self.name = name
            self.color = color?.tagValue
            self.data = .double(data)
        }
        
        public init(name: String, color: Colors? = nil, data: [Double?]) {
            self.name = name
            self.color = color?.tagValue
            self.data = .optionalDouble(data)
        }
        
        public init(name: String, color: Colors? = nil, data: [Int]) {
            self.name = name
            self.color = color?.tagValue
            self.data = .int(data)
        }
        
        public init(name: String, color: Colors? = nil, data: [Int?]) {
            self.name = name
            self.color = color?.tagValue
            self.data = .optionalInt(data)
        }
        
        public init(name: String, color: Colors? = nil, data: [Pair]) {
            self.name = name
            self.color = color?.tagValue
            self.data = .pairs(data)
        }
        
        public init(name: String, color: Colors? = nil, data: [Pair?]) {
            self.name = name
            self.color = color?.tagValue
            self.data = .optionalPairs(data)
        }
    }
    
    public struct ZoomOptions:Codable {
        let enabled:Bool
        
        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }
    
    public struct SparklineOptions:Codable {
        let enabled:Bool
        
        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }
    
    public struct ChartOptions:Codable {
        let fontFamily:String
        let height: Int
        let type: String
        let zoom: ZoomOptions?
        let parentHeightOffset: Int?
        let sparkline:SparklineOptions?
        let toolbar:ToolBarOptions?
        let animations:AnimationsOptions
        let stacked:Bool?
        
        public init(fontFamily: String, height: Int, type: String, zoom: ZoomOptions?, parentHeightOffset: Int?, sparkline: SparklineOptions?, toolbar: ToolBarOptions?, animations: AnimationsOptions, stacked: Bool?) {
            self.fontFamily = fontFamily
            self.height = height
            self.type = type
            self.zoom = zoom
            self.parentHeightOffset = parentHeightOffset
            self.sparkline = sparkline
            self.toolbar = toolbar
            self.animations = animations
            self.stacked = stacked
        }
    }
    
    public struct DataLabelOptions:Codable {
        let enabled:Bool
        
        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }
    
    public struct FillOptions:Codable {
        let opacity:Double
        let type:String?
        
        public init(opacity: Double, type: String?) {
            self.opacity = opacity
            self.type = type
        }
    }
    
    public struct StrokeOptions:Codable {
        public enum StrokeWidth:Codable {
            case single(Int)
            case multiple([Int])
            
            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .single(let val):
                    try container.encode(val)
                case .multiple(let values):
                    try container.encode(values)
                }
            }
        }
        
        public enum DashArray:Codable {
            case single(Int)
            case multiple([Int])
            
            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .single(let val):
                    try container.encode(val)
                case .multiple(let values):
                    try container.encode(values)
                }
            }
        }
        
        public init(width: Int, lineCap: String, curve: String) {
            self.width = .single(width)
            self.dashArray = nil
            self.lineCap = lineCap
            self.curve = curve
        }
        
        public init(width: StrokeWidth, dashArray: DashArray?, lineCap: String, curve: String) {
            self.width = width
            self.dashArray = dashArray
            self.lineCap = lineCap
            self.curve = curve
        }
        
        let width:StrokeWidth
        let dashArray:DashArray?
        let lineCap:String
        let curve:String
    }
    
    public struct TitleOptions:Codable {
        let text:String
        let align:String
        
        public init(text: String, align: String) {
            self.text = text
            self.align = align
        }
    }
    
    public struct ToolBarOptions:Codable {
        let show:Bool
        
        public init(show: Bool) {
            self.show = show
        }
    }
    
    public struct AnimationsOptions:Codable {
        let enabled:Bool
        
        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }
    
    public struct ToolTipOptions:Codable {
        let enabled:Bool?
        let theme:String?
        let fillSeriesColor:Bool?
        
        public init(enabled:Bool? = nil, theme: String? = nil, fillSeriesColor: Bool? = nil) {
            if let enabled, !enabled {
                self.enabled = false
                self.theme = nil
                self.fillSeriesColor = nil
                return
            }
            self.enabled = enabled
            self.theme = theme
            self.fillSeriesColor = fillSeriesColor
        }
        
        public init(theme: String?, fillSeriesColor: Bool? = nil) {
            self.enabled = nil
            self.theme = theme
            self.fillSeriesColor = fillSeriesColor
        }
    }
    
    public struct GridOptions:Codable {
        public struct PaddingOptions:Codable {
            let top:Int
            let right:Int
            let left:Int
            let bottom:Int
            
            public init(top: Int, right: Int, left: Int, bottom: Int) {
                self.top = top
                self.right = right
                self.left = left
                self.bottom = bottom
            }
        }
        public struct RowOptions:Codable {
            let colors:[String]
            let opacity: Double
            
            public init(colors: [String], opacity: Double) {
                self.colors = colors
                self.opacity = opacity
            }
        }
        public struct LinesOptions:Codable {
            let show:Bool
            
            public init(show: Bool) {
                self.show = show
            }
        }
        public struct XAxisGridOptions:Codable {
            let lines:LinesOptions?
            
            public init(lines: LinesOptions?) {
                self.lines = lines
            }
        }
        
        let row:RowOptions?
        let strokeDashArray: Int
        let padding:PaddingOptions?
        let xaxis:XAxisGridOptions?
        
        public init(row: RowOptions?, strokeDashArray: Int, padding: PaddingOptions?, xaxis: XAxisGridOptions?) {
            self.row = row
            self.strokeDashArray = strokeDashArray
            self.padding = padding
            self.xaxis = xaxis
        }
    }
    
    public struct LabelOptions:Codable {
        let padding:Int
        
        public init(padding: Int) {
            self.padding = padding
        }
    }
    
    public struct AxisBorderOptions:Codable {
        let show:Bool
        
        public init(show: Bool) {
            self.show = show
        }
    }
    public struct AxisToolTipOptions:Codable {
        let enabled:Bool
        
        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }
    
    public struct XAxisOptions:Codable {
        let labels:LabelOptions?
        let tooltip:AxisToolTipOptions?
        let axisBorder:AxisBorderOptions?
        let categories:[String]?
        let type:String?
        
        public init(labels: LabelOptions?, tooltip: AxisToolTipOptions?, axisBorder: AxisBorderOptions?, categories: [String]?, type: String?) {
            self.labels = labels
            self.tooltip = tooltip
            self.axisBorder = axisBorder
            self.categories = categories
            self.type = type
        }
    }
    
    public enum XAxisLabelType:String {
        case datetime
        case numeric
    }
    
    public struct YAxisOptions:Codable {
        let labels:LabelOptions
        let max:Int?
        let type:String?
        
        public init(labels: LabelOptions, max: Int?, type: String?) {
            self.labels = labels
            self.max = max
            self.type = type
        }
    }
    
    public struct LegendOptions:Codable {
        public struct Markers:Codable {
            let width:Int
            let height:Int
            let radius:Int
            
            public init(width: Int, height: Int, radius: Int) {
                self.width = width
                self.height = height
                self.radius = radius
            }
        }
        
        public struct ItemMargin:Codable {
            let horizontal:Int
            let vertical:Int
            
            public init(horizontal: Int, vertical: Int) {
                self.horizontal = horizontal
                self.vertical = vertical
            }
        }
        
        let show:Bool
        let position:String?
        let offsetY: Int?
        let markers:Markers?
        let itemMargin:ItemMargin?
        
        public init(show:Bool) {
            if show {
                self.show = true
                self.position = "bottom"
                self.offsetY = 12
                self.markers = .init(width: 10, height: 10, radius: 100)
                self.itemMargin = .init(horizontal: 8, vertical: 8)
            } else {
                self.show = false
                self.position = nil
                self.offsetY = nil
                self.markers = nil
                self.itemMargin = nil
            }
        }
        
        public init(position: String = "bottom", offsetY: Int = 12, markers: Markers = .init(width: 10, height: 10, radius: 100), itemMargin: ItemMargin = .init(horizontal: 8, vertical: 8)) {
            self.show = true
            self.position = position
            self.offsetY = offsetY
            self.markers = markers
            self.itemMargin = itemMargin
        }
    }
    
    public struct BarOptions:Codable {
        let columnWidth:String
        let horizontal:Bool?
        
        public init(columnWidth: String, horizontal: Bool?) {
            self.columnWidth = columnWidth
            self.horizontal = horizontal
        }
    }
    
    public struct PlotOptions:Codable {
        let bar:BarOptions?
        
        public init(bar: BarOptions?) {
            self.bar = bar
        }
    }
    
    public struct MarkerOptions:Codable {
        let size:Int?
        
        public init(size: Int?) {
            self.size = size
        }
    }
    
    public struct Pairs:Codable {
        let data:[Pair]
    }
    
    public struct Pair:Codable {
        let x:Double
        let y:Double
        
        public init(x: Double, y: Double) {
            self.x = x
            self.y = y
        }
    }
    
    public enum SeriesType:Codable {
        case labeled([DataSeries])
        case raw([Double])
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .labeled(let series):
                try container.encode(series)
            case .raw(let series):
                try container.encode(series)
            }
        }
    }
    
    public struct Options:Codable {
        let series:SeriesType
        let chart:ChartOptions
        let dataLabels:DataLabelOptions?
        let fill:FillOptions?
        let stroke:StrokeOptions?
        let title:TitleOptions?
        let tooltip:ToolTipOptions
        let grid:GridOptions?
        let xaxis:XAxisOptions?
        let yaxis:YAxisOptions?
        let colors:[String]
        let labels:[String]?
        let legend:LegendOptions
        let plotOptions:PlotOptions?
        let markers:MarkerOptions?
        
        public init(series: SeriesType, chart: ChartOptions, dataLabels: DataLabelOptions?, fill: FillOptions?, stroke: StrokeOptions?, title: TitleOptions?, tooltip: ToolTipOptions, grid: GridOptions?, xaxis: XAxisOptions?, yaxis: YAxisOptions?, colors: [String], labels: [String]?, legend: LegendOptions, plotOptions: PlotOptions?, markers: MarkerOptions?) {
            self.series = series
            self.chart = chart
            self.dataLabels = dataLabels
            self.fill = fill
            self.stroke = stroke
            self.title = title
            self.tooltip = tooltip
            self.grid = grid
            self.xaxis = xaxis
            self.yaxis = yaxis
            self.colors = colors
            self.labels = labels
            self.legend = legend
            self.plotOptions = plotOptions
            self.markers = markers
        }
    }
   
    let uuid:UUID
    let options:Chart.Options
    
    public init(uuid:UUID = UUID(), options:Chart.Options) {
        self.uuid = uuid
        self.options = options
    }
    
    public func body() async -> Component {
        // Include our JS Library
        deps.addJSSource("/libs/apexcharts/dist/apexcharts.min.js")
        
        // Inject our component specific script
        deps.addRawScript(buildScript())
        
        // Return the component
        return Div { }
            .id("chart-\(uuid.uuidString)")
    }
    
    func buildScript() -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted]
        guard let jsonOpts = try? encoder.encode(options) else { return "" }
        
        let script = """
        
        document.addEventListener("DOMContentLoaded", function () {
            window.ApexCharts && (new ApexCharts(document.getElementById('chart-\(uuid.uuidString)'),\(String(data: jsonOpts, encoding: .utf8)!))).render();
        });

        """
        
        return replaceColorComponents(script)
        
        //.replacingOccurrences(of: "\"tabler.getColor(\\\"primary\\\")\"", with: "tabler.getColor('primary')")
    }
    
    func replaceColorComponents(_ str:String) -> String {
        let regex = #/"{{{([^\s]+)}}}"/#
        
        let new = str.replacing(regex, with: { i in
            //print(i)
            let match = i.output.1
            return "tabler.getColor(\"\(match)\")"
        })
        
        return new
    }
    
//    func buildScript2() -> String {
//        return """
//
//          document.addEventListener("DOMContentLoaded", function () {
//              window.ApexCharts && (new ApexCharts(document.getElementById('chart-uptime-incidents'), {
//                  chart: {
//                      type: "bar",
//                      fontFamily: 'inherit',
//                      height: 240,
//                      parentHeightOffset: 0,
//                      toolbar: {
//                          show: false,
//                      },
//                      animations: {
//                          enabled: false
//                      },
//                  },
//                  plotOptions: {
//                      bar: {
//                          columnWidth: '50%',
//                      }
//                  },
//                  dataLabels: {
//                      enabled: false,
//                  },
//                  fill: {
//                      opacity: 1,
//                  },
//                  series: [{
//                      name: "Uptime incidents",
//                      data: [1, 2, 6, 3, 1, 1, 2, 5, 2, 5, 6, 2, 4, 3, 4, 5, 4, 3, 2, 1, 2, 0, 2, 1, 1]
//                  }],
//                  tooltip: {
//                      theme: 'dark'
//                  },
//                  grid: {
//                      padding: {
//                          top: -20,
//                          right: 0,
//                          left: -4,
//                          bottom: -4
//                      },
//                      strokeDashArray: 4,
//                  },
//                  xaxis: {
//                      labels: {
//                          padding: 0,
//                      },
//                      tooltip: {
//                          enabled: false
//                      },
//                      axisBorder: {
//                          show: false,
//                      },
//                      type: 'datetime',
//                  },
//                  yaxis: {
//                      labels: {
//                          padding: 4
//                      },
//                      max: 20,
//                  },
//                  labels: [
//                      '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14'
//                  ],
//                  colors: [tabler.getColor("red")],
//                  legend: {
//                      show: false,
//                  },
//              })).render();
//          });
//
//        """
//            //.replacingOccurrences(of: "\"tabler.getColor(", with: "tabler.getColor(").replacingOccurrences(of: "\"tabler.getColor(", with: "tabler.getColor(")
//    }

    public enum LineStyle:String {
        case smooth
        case straight
        case stepline
        case scatter
    }
    
    public enum FillStyle {
        case noFill
        case fill(Double)
        
        func chartType(lineStyle: LineStyle) -> String {
            if lineStyle == .scatter { return "scatter" }
            switch self {
            case .noFill:
                return "line"
            case .fill:
                return "area"
            }
        }
        
        var fill:FillOptions? {
            switch self {
            case .noFill:
                return .init(opacity: 1, type: nil)
            case .fill(let opacity):
                return .init(opacity: opacity, type: "solid")
            }
        }
    }
    
    public static func basicLineChart(lineStyle:LineStyle = .smooth, fillStyle:FillStyle = .noFill, title:String, series:[DataSeries], xAxisLabels:[String]? = nil, datetimeLabels:Bool = true, color:Colors = .primary, height:Int = 240, markers:MarkerOptions? = nil, dataLabelsEnabled:Bool = false) -> Chart.Options {
        Options(
            series: .labeled(series),
            chart: .init(fontFamily: "inherit", height: height, type: fillStyle.chartType(lineStyle: lineStyle), zoom: .init(enabled: false), parentHeightOffset: 0, sparkline: nil, toolbar: .init(show: false), animations: .init(enabled: true), stacked: nil),
            dataLabels: .init(enabled: dataLabelsEnabled),
            fill: fillStyle.fill,
            stroke: .init(width: 2, lineCap: "round", curve: lineStyle.rawValue),
            title: nil, //.init(text: title, align: "left"),
            tooltip: .init(theme: "dark"),
            grid: .init(row: nil, strokeDashArray: 4, padding: .init(top: -20, right: 0, left: -4, bottom: -4), xaxis: nil), //.init(colors: ["#f3f3f3", "transparent"], opacity: 0.5)
            xaxis: .init(labels: .init(padding: 0), tooltip: nil, axisBorder: nil, categories: nil, type: datetimeLabels ? "datetime" : series.first!.data.isNumeric ? "numeric" : nil),
            yaxis: .init(labels: .init(padding: 4), max: nil, type: nil),
            colors: [color.tagValue],
            labels: xAxisLabels,
            legend: .init(show: true),
            plotOptions: nil,
            markers: markers
        )
    }
    
    public static func multiLineChart(lineStyle:LineStyle = .smooth, fillStyle:FillStyle = .noFill, stacked:Bool? = nil, title:String?, series:[DataSeries], xAxisLabels:[String], datetimeLabels:Bool = true, colors:[Colors], height:Int = 240, legend:LegendOptions? = nil, markers:MarkerOptions? = nil, dataLabelsEnabled:Bool = false) -> Chart.Options {
        Options(
            series: .labeled(series),
            chart: .init(fontFamily: "inherit", height: height, type: fillStyle.chartType(lineStyle: lineStyle), zoom: .init(enabled: false), parentHeightOffset: 0, sparkline: nil, toolbar: .init(show: false), animations: .init(enabled: true), stacked: stacked),
            dataLabels: .init(enabled: dataLabelsEnabled),
            fill: fillStyle.fill,
            stroke: .init(width: 2, lineCap: "round", curve: lineStyle.rawValue),
            title: nil, //.init(text: title, align: "left"),
            tooltip: .init(theme: "dark"),
            grid: .init(row: nil, strokeDashArray: 4, padding: .init(top: -20, right: 0, left: -4, bottom: -4), xaxis: nil), //.init(colors: ["#f3f3f3", "transparent"], opacity: 0.5)
            xaxis: .init(labels: .init(padding: 0), tooltip: nil, axisBorder: nil, categories: nil, type: datetimeLabels ? "datetime" : series.first!.data.isNumeric ? "numeric" : nil),
            yaxis: .init(labels: .init(padding: 4), max: nil, type: nil),
            colors: colors.map { $0.tagValue },
            labels: xAxisLabels,
            legend: legend ?? .init(show: true),
            plotOptions: nil,
            markers: markers
        )
    }
    
    public static func basicBarChart(horizontal:Bool = false, stacked:Bool = false, title:String, series:[DataSeries], xAxisLabels:[String], colors:[Colors] = [.primary], height:Int = 240, maxYValue:Int? = nil) -> Chart.Options {
        Options(
            series: .labeled(series),
            chart: .init(fontFamily: "inherit", height: height, type: "bar", zoom: nil, parentHeightOffset: 0, sparkline: nil, toolbar: .init(show: false), animations: .init(enabled: true), stacked: stacked),
            dataLabels: .init(enabled: false),
            fill: .init(opacity: 1, type: "solid"),
            stroke: nil,
            title: nil, //.init(text: title, align: "left"),
            tooltip: .init(theme: "dark"),
            grid: .init(row: nil, strokeDashArray: 4, padding: .init(top: -20, right: 0, left: -4, bottom: -4), xaxis: nil), //.init(colors: ["#f3f3f3", "transparent"], opacity: 0.5)
            xaxis: .init(labels: .init(padding: 0), tooltip: nil, axisBorder: nil, categories: nil, type: "datetime"),
            yaxis: .init(labels: .init(padding: 4), max: maxYValue, type: horizontal ? "datetime" : nil),
            colors: colors.map { $0.tagValue },
            labels: xAxisLabels,
            legend: .init(show: false),
            plotOptions: .init(bar: .init(columnWidth: "50%", horizontal: horizontal)),
            markers: nil
        )
    }
    
    public static func basicPieChart(title:String, series:[Double], labels:[String], colors:[Colors], height:Int = 240, maxYValue:Int? = nil) -> Chart.Options {
        Options(
            series: .raw(series),
            chart: .init(fontFamily: "inherit", height: height, type: "donut", zoom: nil, parentHeightOffset: 0, sparkline: .init(enabled: true), toolbar: .init(show: false), animations: .init(enabled: true), stacked: nil),
            dataLabels: nil,
            fill: .init(opacity: 1, type: "solid"),
            stroke: nil,
            title: nil, //.init(text: title, align: "left"),
            tooltip: .init(theme: "dark", fillSeriesColor: false),
            grid: .init(row: nil, strokeDashArray: 4, padding: nil, xaxis: nil),
            xaxis: nil,
            yaxis: nil,
            colors: colors.map { $0.tagValue },
            labels: labels,
            legend: .init(position: "bottom", offsetY: 12, markers: .init(width: 10, height: 10, radius: 100), itemMargin: .init(horizontal: 8, vertical: 8)),
            plotOptions: nil,
            markers: nil
        )
    }
    
}

