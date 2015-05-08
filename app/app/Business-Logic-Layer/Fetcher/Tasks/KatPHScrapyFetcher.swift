//
//  KatPHScrapyFetcher.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import Alamofire

class KatPHScrapyFetcher: FetchProtocal {
    
    
    
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
        let data:OGNode = ObjectiveGumbo.parseDocumentWithString(html)
        let divArray:NSArray = data.elementsWithClass("data")
        
        if(divArray.count == 1){
            let searchResultsElement:OGElement = divArray[0] as! OGElement
            //            println("result is \( searchResultsElement.html())")
            
            self.parseResultsElement(searchResultsElement)
        }
    }
    
    func parseResultsElement(searchResultsElement:OGElement){
        let divArray:NSArray = searchResultsElement.elementsWithClass("jobCard")
        
        println("divArray is \(divArray.count)")
        for resultElement in divArray{
            self.parseResultelement(resultElement as! OGElement)
        }
    }
    
    func parseResultelement(searchResultsElement:OGElement){
        var divArray:NSArray = searchResultsElement.elementsWithClass("title")
        
        var title = ""
        var link = ""
        var content = ""
        
        if(divArray.count == 1){
            let element:OGElement = divArray[0] as! OGElement
            //            title = element.attributes[""] as String
            println("\(element.attributes)")
        }
        
        
        //        println("divArray is \(divArray.count)")
        //        jobCard
    }
    
}