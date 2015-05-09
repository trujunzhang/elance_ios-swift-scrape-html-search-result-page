//
//  ElanceScrapyFetcher.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class ElanceScrapyFetcher: FetcherBaseParser {
    let model_xpath_dictxxx = [
        "root":"//div[@id='jobSearchResults']//div[@data-pos]",
        "title": "div[1]/a[1]/text()",
//                "content":"//*[@class='desc']/text()"
//        "content":"div[3]/text()"
        "content":"div[3]/text()"
    ]
    
    let model_xpath_dict = [
        "root":"//div[@id='jobSearchResults']//div[@data-pos]",
        "title": "div[1]/a[1]/text()",
//                        "content":"//div[contains(@class,'desc') and contains(@class ,'collapsed')]/text()"
                                "content":"//div[contains(@class,'desc')]/text()"
        //        "content":"div[3]/text()"
//        "content":"div[3]"
    ]
    
    override func getHost() -> String{
        return "https://www.elance.com/r/jobs/q-scrapy/"
    }
    
    override func fetchHtml(completeHandler: ObjectHandler) {
        super.fetchHtml(completeHandler)
        
        //        let url = "https://www.elance.com/r/jobs/q-scrapy/"
        
        //        DownloadHtmlHelper.downlaodHtml(getHost()) {
        //            (object, error) -> Void in
        //            if (error == nil) {
        //                let html: String = object as! String
        //                self.parseHtml(html)
        //            } else {
        //                let x = 0
        //            }
        //        }
    }
    
    override func parseHtml(html: String) {
        
        
        //        let xpath = "//div[@id=\"jobSearchResults\"]//div[@data-pos]"
        
        let doc : GDataXMLDocument = GDataXMLDocument(HTMLString: html, error: nil)
        
        let searchResults:NSArray = doc.nodesForXPath(model_xpath_dict["root"], error: nil)
        
        //        println("length is \(searchResults.count)")
        
        for resultElement in searchResults{
//            self.parseResultelement(resultElement as! GDataXMLElement)
        }
        
//         self.parseResultelement(searchResults[1] as! GDataXMLElement)
              self.parseResultelement(searchResults[1] as! GDataXMLElement)
    }
    
    
    func parseResultelement(element:GDataXMLElement){
        //        let title_xpath = "div[1]/a[1]/text()"
        
        //        var title = getNodeText(element,xpath:model_xpath_dict["title"]!)
        var link = ""
        var content = getNodeText(element,xpath:model_xpath_dict["content"]!)
        
        //        println("\(title)")
        //        println("xxxxx")
        println("content is \(content)")
        
        //        let titleResults:NSArray = element.nodesForXPath(title_xpath, error: nil)
        //        if(titleResults.count == 1){
        //            let titleNode: GDataXMLNode = titleResults[0] as! GDataXMLNode
        //            title =  titleNode.XMLString()
        //            println("\(titleNode.XMLString())")
        //        }
        
        
    }

    
}