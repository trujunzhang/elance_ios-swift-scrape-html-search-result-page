//
//  HtmlRegexReplaceTests.swift
//  appBDD
//
//  Created by djzhang on 5/9/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit
import XCTest

class HtmlRegexReplaceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
//        let html =
        var rx = NSRegularExpression.rx("<span.*span>", options: .CaseInsensitive);
//        let  xx =  html.replace(rx, with: html )
    }



}
