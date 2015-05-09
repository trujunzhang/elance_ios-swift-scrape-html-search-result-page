//
//  ElanceScrapyFetcher.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class ElanceScrapyFetcher: FetcherBaseParser {
    
    let elance_host = "https://www.elance.com/r/jobs/q-"
    
    let model_xpath_dict = [
        "root": "//div[@id='jobSearchResults']//div[@data-pos]",
        "title": "//div/a[1]/text()",
        "href": "//div/a[1]/@href",
        "content": "//div/text()[not(parent::span)]"
    ]
    
    override func getHost() -> String {
        return "https://www.elance.com/r/jobs/q-scrapy/"
    }
    
    override func fetchHtml(completeHandler: ObjectHandler) {
        super.fetchHtml(completeHandler)
    }
    
    override func parseHtml(html: String) -> NSMutableArray {
        var array: NSMutableArray = NSMutableArray()
        let doc: GDataXMLDocument = GDataXMLDocument(HTMLString: html, error: nil)
        let searchResults: NSArray = doc.nodesForXPath(model_xpath_dict["root"], error: nil)
        
        for resultElement in searchResults {
            let data: HtmlResultData = self.parseResultElement(resultElement as! GDataXMLElement) // used
            array.addObject(data)
        }
        
        //        self.parseResultElement(searchResults[1] as! GDataXMLElement) // test
//        self.parseResultElement(searchResults[4] as! GDataXMLElement) // test
        
        return array
    }
    
    func parseResultElement(element: GDataXMLElement) -> HtmlResultData {
        // retrieve title
        var titleNode: GDataXMLNode = element.childAtIndex(1)
        var title = self.parseElement(titleNode.XMLString(), xpath: model_xpath_dict["title"]!)
        println("\(title)")
        // retrieve a href
        var hrefNode: GDataXMLNode = element.childAtIndex(1)
        var href = self.parseElement(hrefNode.XMLString(), xpath: model_xpath_dict["href"]!)
        println("\(href)")
        // retrieve description
        let contentNode: GDataXMLNode = element.childAtIndex(5)
        var content = self.parseElement(contentNode.XMLString(), xpath: model_xpath_dict["content"]!)
        println("content is \(content)")
        
        return HtmlResultData(title: title, link: href, content: content)
    }
    
    func parseElement(xmlString: String, xpath: String) -> String {
        var rx = NSRegularExpression.rx("<span.*span>", options: .CaseInsensitive);
        let result = xmlString.replace(rx, with: "")
        
        let doc: GDataXMLDocument = GDataXMLDocument(HTMLString: result, error: nil)
        var nodeText = getNodeText(doc, xpath: xpath)
        
        return nodeText
    }
    
}