//
//  FetcherBaseParser.swift
//  app
//
//  Created by djzhang on 5/9/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class FetcherBaseParser: FetchProtocal {
    
    
    var searchWish = ""
    
    func getHost() -> String {
        return ""
    }

    func fetchHtml(search:String,completeHandler: ObjectHandler) {
        self.searchWish = search
        
        DownloadHtmlHelper.downlaodHtml(getHost()) {
            (object, error) -> Void in
            if (error == nil) {
                let html: String = object as! String
                let array:NSMutableArray = self.parseHtml(html)
                completeHandler(array,true)
            } else {
               completeHandler(nil,false)
            }
        }
    }

    func parseHtml(html: String) -> NSMutableArray{

        return  NSMutableArray()
    }

    // MARK:
    func getNodeText(element: GDataXMLDocument, xpath: String) -> String {
        var text = ""
        let array: NSArray = element.nodesForXPath(xpath, error: nil)

        if (array.count == 1) {
            let titleNode: GDataXMLNode = array[0] as! GDataXMLNode
            text = titleNode.XMLString()
        }

        return text
    }
}