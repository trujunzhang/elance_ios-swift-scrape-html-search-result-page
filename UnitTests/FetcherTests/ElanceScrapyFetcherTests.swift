//
//  ElanceScrapyFetcherTests.swift
//  appBDD
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit
import XCTest

class ElanceScrapyFetcherTests: XCTestCase {
    
    var fetcher: ElanceScrapyFetcher?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        fetcher = ElanceScrapyFetcher()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        fetcher = nil
    }
    
    func _testElanceScrapyFetcher() {
        // This is an example of a functional test case.
        let expectation = expectationWithDescription("ElanceScrapyFetcher")
        
        fetcher?.fetchHtml({ (object, sucess) -> Void in
            expectation.fulfill()
        })
        
        
        waitForExpectationsWithTimeout(100) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    
    
}
