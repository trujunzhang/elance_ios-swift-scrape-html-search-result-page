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
    
    static let sharedInstance : KatPHScrapyFetcher = KatPHScrapyFetcher()
    
    func test(){
        
//        Alamofire.download(.GET, "https://www.google.com/#newwindow=1", parameters: ["q": "swift"]), { (temporaryURL, response) in
        
        Alamofire.download(.GET, "http://www.baidu.com", { (temporaryURL, response) in

//            Alamofire.download(.GET, "https://www.google.com", { (temporaryURL, response) in
            
                
            if let directoryURL = NSFileManager.defaultManager()
                .URLsForDirectory(.DocumentDirectory,
                    inDomains: .UserDomainMask)[0]
                as? NSURL {
                    let pathComponent = response.suggestedFilename
                    
//                    let pathComponent = "html"
                    
                    println(response)
                    println("temporaryURL is \(temporaryURL)")
                    
                    return directoryURL.URLByAppendingPathComponent(pathComponent!)
            }

            return temporaryURL
        })

    }
    
}