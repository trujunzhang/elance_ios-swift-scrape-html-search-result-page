//
//  FetcherBaseParser.swift
//  app
//
//  Created by djzhang on 5/9/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class FetcherBaseParser: FetchProtocal {
    func getHost() -> String {
        return ""
    }

    func fetchHtml(completeHandler: ObjectHandler) {
        DownloadHtmlHelper.downlaodHtml(getHost()) {
            (object, error) -> Void in
            if (error == nil) {
                let html: String = object as! String
                self.parseHtml(html)
            } else {
                let x = 0
            }
        }
    }

    func parseHtml(html: String) {

    }

    // MARK:
    func getNodeText(element: GDataXMLDocument, xpath: String) -> String {
        var text = ""
        let array: NSArray = element.nodesForXPath(xpath, error: nil)
        println("length in getNodeText is \(array.count)")

//        for element in array {
//            let titleNode: GDataXMLNode = element as! GDataXMLNode
//            println("titleNode is \(titleNode.XMLString())")
//        }

        if (array.count == 1) {
            let titleNode: GDataXMLNode = array[0] as! GDataXMLNode
            text = titleNode.XMLString()

//            println("\(titleNode.XMLString())")
        }

        return text
    }

    func getNodeText123(element: GDataXMLElement, xpath: String) -> String {
        var text = ""
        let titleResults: NSArray = element.nodesForXPath(xpath, error: nil)
        println("length in getNodeText is \(titleResults.count)")

        for element in titleResults {
            let titleNode: GDataXMLNode = element as! GDataXMLNode
            println("titleNode is \(titleNode.XMLString())")
        }

        if (titleResults.count == 1) {
            let titleNode: GDataXMLNode = titleResults[0] as! GDataXMLNode
            text = titleNode.XMLString()

//            println("\(titleNode.XMLString())")
        }

        return text
    }
}