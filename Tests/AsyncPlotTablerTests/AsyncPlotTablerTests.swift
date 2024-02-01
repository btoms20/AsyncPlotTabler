import XCTest
@testable import AsyncPlotTabler

final class AsyncPlotTablerTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testDisplayVisibleCSS() throws {
        let visibleOnlyOnXS:[DeviceSize] = [.xs]
        XCTAssertEqual(visibleOnlyOnXS.visibleCSS(.block), "d-block d-sm-none")
        
        let visibleOnlyOnSM:[DeviceSize] = [.sm]
        XCTAssertEqual(visibleOnlyOnSM.visibleCSS(.block), "d-none d-sm-block d-md-none")
        
        let visibleOnlyOnMD:[DeviceSize] = [.md]
        XCTAssertEqual(visibleOnlyOnMD.visibleCSS(.block), "d-none d-md-block d-lg-none")
        
        let visibleOnlyOnLG:[DeviceSize] = [.lg]
        XCTAssertEqual(visibleOnlyOnLG.visibleCSS(.block), "d-none d-lg-block d-xl-none")
        
        let visibleOnlyOnXL:[DeviceSize] = [.xl]
        XCTAssertEqual(visibleOnlyOnXL.visibleCSS(.block), "d-none d-xl-block d-xxl-none")
        
        let visibleOnlyOnXXL:[DeviceSize] = [.xxl]
        XCTAssertEqual(visibleOnlyOnXXL.visibleCSS(.block), "d-none d-xxl-block")
        
        let visibleOnlyOnMultiple:[DeviceSize] = [.md, .lg]
        XCTAssertEqual(visibleOnlyOnMultiple.visibleCSS(.block), "d-none d-md-block d-xl-none")
        
        let visibleOnlyOnMultiple2:[DeviceSize] = [.md, .lg, .xl]
        XCTAssertEqual(visibleOnlyOnMultiple2.visibleCSS(.block), "d-none d-md-block d-xxl-none")
        
        let visibleOnlyOnMultiple3:[DeviceSize] = [.md, .lg, .xl, .xxl]
        XCTAssertEqual(visibleOnlyOnMultiple3.visibleCSS(.block), "d-none d-md-block")
    }
    
    func testDisplayHiddenCSS() throws {
        let hiddenOnlyOnXS:[DeviceSize] = [.xs]
        XCTAssertEqual(hiddenOnlyOnXS.hiddenCSS(.block), "d-none d-sm-block")
        
        let hiddenOnlyOnSM:[DeviceSize] = [.sm]
        XCTAssertEqual(hiddenOnlyOnSM.hiddenCSS(.block), "d-sm-none d-md-block")
        
        let hiddenOnlyOnMD:[DeviceSize] = [.md]
        XCTAssertEqual(hiddenOnlyOnMD.hiddenCSS(.block), "d-md-none d-lg-block")
        
        let hiddenOnlyOnLG:[DeviceSize] = [.lg]
        XCTAssertEqual(hiddenOnlyOnLG.hiddenCSS(.block), "d-lg-none d-xl-block")
        
        let hiddenOnlyOnXL:[DeviceSize] = [.xl]
        XCTAssertEqual(hiddenOnlyOnXL.hiddenCSS(.block), "d-xl-none d-xxl-block")
        
        let hiddenOnlyOnXXL:[DeviceSize] = [.xxl]
        XCTAssertEqual(hiddenOnlyOnXXL.hiddenCSS(.block), "d-xxl-none")
        
        let hiddenOnlyOnMultiple:[DeviceSize] = [.xs, .md, .xxl]
        XCTAssertEqual(hiddenOnlyOnMultiple.hiddenCSS(.block), "d-none d-sm-block d-md-none d-lg-block d-xxl-none")
    }
}
