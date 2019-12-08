//
//  CategorizationTest.swift
//  CategorizationTest
//
//  Created by  on 7/19/19.
//

import XCTest
import Categorization

@objcMembers class Test: NSObject {
    var field1: String!
    private var _field2: Bool = true
    
    var isField2: Bool {
        return _field2
    }
    
    func setField2(field2: Bool) {
        _field2 = field2
    }
    
    init(_ field1:String, field2:Bool) {
        super.init()
        self._field2 = field2
        self.field1 = field1
    }
}

class NSCategorizationTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let object1 = Test("Test1",field2: true)
        let object2 = Test("Test2",field2: false)
        let object3 = Test("Prueba1",field2: true)
        let object4 = Test("Prueba2",field2: false)
        let array = [object3, object2, object1, object4]
        let p1 = NSPredicate(format: "isField2 == TRUE")
        let category1 = NSCategory(withTitle: "Cat1", filterPredicate: p1, sortIndex: 1, isAlwaysVisible: true)
        let p2 = NSPredicate(format: "isField2 == FALSE")
        let category2 = NSCategory(withTitle: "Cat2", filterPredicate: p2, sortIndex: 2, isAlwaysVisible: true)
        let categories = NSCategories(categories: [category1,category2])
        categories.visibleCategoriesPredicate = NSPredicate(value: true)
        let filter = NSPredicate(format:"field1 like \"Pru*\"")
        let categorization = NSCategorization(forItems: array,withCategories: categories,andUserFilter: filter)
        let catitems1 = categorization.items(forCategory: "Cat1")
        dump(catitems1)
        let catitems2 = categorization.items(forCategory: "Cat2")
        dump(catitems2)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure(metrics: [XCTCPUMetric()]) {
            // Put the code whose CPU performance you want to measure here.
        }
    }

}
