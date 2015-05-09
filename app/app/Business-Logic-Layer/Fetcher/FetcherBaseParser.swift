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
    
    // abstract method
    func getHost() -> String {
        return ""
    }
    // abstract method
    func parseHtml(html: String) -> NSMutableArray{
        return  NSMutableArray()
    }
    
    func fetchHtml(search:String,completeHandler: ObjectHandler) {
        self.searchWish = search.stringByReplacingOccurrencesOfString(" ", withString: "%20")

        DownloadHtmlHelper.downlaodHtml(getHost()) {
            (object, error) -> Void in
            
            if (error == nil) {
                if(object == nil){
                    completeHandler(nil,false)
                }else{
                    let html: String = object as! String
                    let array:NSMutableArray = self.parseHtml(html)
                    completeHandler(array,true)
                }
            } else {
                completeHandler(nil,false)
            }
            
        }
    }
    
    // MARK: common method
    func makeNewDocumentFromSnipet(htmlSnippet: String) -> GDataXMLDocument{
        let doc: GDataXMLDocument = GDataXMLDocument(HTMLString: htmlSnippet, error: nil)
        
        return doc
    }
}