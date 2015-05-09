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
        "root":               "//div[@id='jobSearchResults']//div[@data-pos]",
        "title":              "//div/a/text()",
        "href":               "//div/a/@href",
        "contentBlock":       "//div//div[@id][@class]",
        "content":            "//div[@class][@id]/text()"
    ]
    
    override func getHost() -> String {
        return "\(elance_host)\(searchWish)/"
    }
    
    override func fetchHtml(search:String,completeHandler: ObjectHandler) {
        super.fetchHtml(search,completeHandler: completeHandler)
    }
    
    override func parseHtml(html: String) -> NSMutableArray {
        var array: NSMutableArray = NSMutableArray()
        let doc: GDataXMLDocument = makeNewDocumentFromSnipet(html)
        let searchResults: NSArray = doc.nodesForXPath(model_xpath_dict["root"], error: nil)
        
        for resultElement in searchResults {
            let divDoc: GDataXMLDocument =  makeNewDocumentFromSnipet(resultElement.XMLString())
            let data: HtmlResultData = self.parseResultElement(divDoc.rootElement())
            if(data.title.isEmpty == false){
                array.addObject(data)
            }
        }
        
        return array
    }
    
    func parseResultElement(element: GDataXMLElement) -> HtmlResultData {
        // get title
        var titleNode: GDataXMLNode = element.firstNodeForXPath(model_xpath_dict["title"]!, error: nil)
        var title = titleNode.XMLString()
        // get a href
        var hrefNode: GDataXMLNode = element.firstNodeForXPath(model_xpath_dict["href"]!, error: nil)
        var href = hrefNode.XMLString()
        // get description
        var content = parseSpecialContentNode(element)
        
        return HtmlResultData(title: title, link: href, content: content)
    }
    
    func parseSpecialContentNode(element: GDataXMLElement) -> String{
        // get div class named 'desc'
        let contentNode: GDataXMLNode = element.firstNodeForXPath(model_xpath_dict["contentBlock"]!, error: nil)
        let contentSource = trimSpecialTags(contentNode.XMLString())
        
        // parse new div class named 'desc'
        let descDoc: GDataXMLDocument =  makeNewDocumentFromSnipet(contentSource)
        let node:GDataXMLNode = descDoc.rootElement().firstNodeForXPath(model_xpath_dict["content"]!, error: nil)
        
        var content =  node.XMLString()
        
        return content
    }
    
    func trimSpecialTags(htmlSnippet:String) -> String{
        var rx = NSRegularExpression.rx("<span.*span>", options: .CaseInsensitive);
        let result = htmlSnippet.replace(rx, with: "")
        
        return result
    }
    
}