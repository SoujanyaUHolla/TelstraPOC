//
//  TelstraPOCTests.swift
//  TelstraPOCTests
//
//  Created by Soujanya on 03/05/20.
//  Copyright © 2020 Soujanya. All rights reserved.
//

import XCTest
@testable import TelstraPOC

class TelstraPOCTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            _ = InfoModel(title:"Housing", description:"Warmer than you might think.", imageHref:"http://icons.iconarchive.com/icons/iconshock/alaska/256/Igloo-icon.png")
        }
        
    }
    
 func testInfoModel() throws{
    
        let path = Bundle(for:TelstraPOCTests.self).path(forResource:"serverData", ofType:"json")!
        let data = NSData(contentsOfFile:path)! as Data
        
        let decoder = JSONDecoder()
        
            let decoded = try decoder.decode(MainInfo.self, from:data)
        
            XCTAssertEqual(decoded.title, "About Canada")
    
            XCTAssertEqual(decoded.rows[0].title, "Beavers")
    
            XCTAssertEqual(decoded.rows[8].description, "Canada hopes to soon launch a man to the moon.")
    
            XCTAssertEqual(decoded.rows[12].imageHref, "http://3.bp.blogspot.com/__mokxbTmuJM/RnWuJ6cE9cI/AAAAAAAAATw/6z3m3w9JDiU/s400/019843_31.jpg")
   }

    
    
    

}
