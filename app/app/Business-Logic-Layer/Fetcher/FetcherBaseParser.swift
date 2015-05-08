//
//  FetcherBaseParser.swift
//  app
//
//  Created by djzhang on 5/9/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class FetcherBaseParser: FetchProtocal{
    func getHost() -> String{
        return ""
    }
    
    func fetchHtml(completeHandler: ObjectHandler){
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
    
    func parseHtml(html:String){
        
    }
}