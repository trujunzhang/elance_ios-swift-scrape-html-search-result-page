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
        let queryUrl = "\(elance_host)-scrapy"
        DownloadHtmlHelper.downlaodHtml(queryUrl)
        
        parseHtml
    }
    
    
    func parseHtml(html:String){
        
    }
    
}