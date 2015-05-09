//
//  KatPHScrapyFetcher.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import Alamofire

class KatPHScrapyFetcher: NSObject {
    
    
    
    func fetchHtml(completeHandler: ObjectHandler) {
        let url = kickass_host
        
        DownloadHtmlHelper.downlaodHtml(url) {
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
    
}