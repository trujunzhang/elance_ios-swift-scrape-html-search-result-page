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

    func _testParseTitle() {
        let html = readFile("title")
//        println("\(html)")

        let doc: GDataXMLDocument = GDataXMLDocument(HTMLString: html, error: nil)
        let titleNode: GDataXMLNode = doc.firstNodeForXPath("//div/a[1]/@href", error: nil)

        let text = titleNode.XMLString()

        println("\(titleNode.XMLString())")
    }

    func _testParseContent() {
        let html = readFile("spanContent")

        var rx = NSRegularExpression.rx("<span.*span>", options: .CaseInsensitive);
        let result = html.replace(rx, with: "")
        println("\(result)")

        let doc: GDataXMLDocument = GDataXMLDocument(HTMLString: result, error: nil)
        let titleResults: NSArray = doc.nodesForXPath("//div/text()[not(parent::span)]", error: nil)

        let titleNode: GDataXMLNode = titleResults[0] as! GDataXMLNode
        let text = titleNode.XMLString()
    }
    
    func testEncodeSearchWish(){
        let searchWish = "ios 8"
        let encodeString = searchWish.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        println("[\(encodeString)]")
        
        let aString: String = "This is my string"
        let newString = aString.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        println("escapedString: \(newString)")

    }
    


}
