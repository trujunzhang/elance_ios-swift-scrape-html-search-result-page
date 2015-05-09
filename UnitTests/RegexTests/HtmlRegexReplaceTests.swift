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

    let html = ""

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func readFile(fileName: String) -> String {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "html")
//         println("\(path)")
        var data = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)

        return data!
    }

    func testParseContent() {
        let html = readFile("content")
//        println("\(html)")
        var rx = NSRegularExpression.rx("<span.*span>", options: .CaseInsensitive);
        let result = html.replace(rx, with: "")
//        println("\(result)")

        let doc: GDataXMLDocument = GDataXMLDocument(HTMLString: result, error: nil)
        let titleResults: NSArray = doc.nodesForXPath("//div/text()[not(parent::span)]", error: nil)

        println("length in getNodeText is \(titleResults.count)")

        let titleNode: GDataXMLNode = titleResults[0] as! GDataXMLNode
        let text = titleNode.XMLString()

        println("\(titleNode.XMLString())")

    }


}
