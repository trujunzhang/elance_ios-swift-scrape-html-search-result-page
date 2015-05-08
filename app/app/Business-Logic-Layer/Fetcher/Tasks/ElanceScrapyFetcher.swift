//
//  ElanceScrapyFetcher.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class ElanceScrapyFetcher: FetchProtocal {
    
    func fetchHtml(completeHandler: ObjectHandler){
        let url = "\(elance_host)-scrapy"
//        DownloadHtmlHelper.downlaodHtml(queryUrl)
        DownloadHtmlHelper.downlaodHtml(url) { (object, error) -> Void in
            if(error == nil){
                
            }else{
                let html:String = object as! String
                self.parseHtml(html)
            }
        }
    }
    
    
    func parseHtml(html:String){
        
    }
    
}