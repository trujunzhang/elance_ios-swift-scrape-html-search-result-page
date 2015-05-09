//
//  ElanceScrapyFetcher.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class ElanceScrapyFetcher: FetcherBaseParser {
    let model_xpath_dict = [
            "root": "//div[@id='jobSearchResults']//div[@data-pos]",
            "title": "//div/a[1]/text()",
            "content": "//div/text()[not(parent::span)]"
    ]

    override func getHost() -> String {
        return "https://www.elance.com/r/jobs/q-scrapy/"
    }

    override func fetchHtml(completeHandler: ObjectHandler) {
        super.fetchHtml(completeHandler)
    }

    override func parseHtml(html: String) {
        let doc: GDataXMLDocument = GDataXMLDocument(HTMLString: html, error: nil)
        let searchResults: NSArray = doc.nodesForXPath(model_xpath_dict["root"], error: nil)

        for resultElement in searchResults {
            //            self.parseResultElement(resultElement as! GDataXMLElement) // used
        }

        //        self.parseResultElement(searchResults[1] as! GDataXMLElement) // test
        self.parseResultElement(searchResults[4] as! GDataXMLElement) // test
    }

    func parseResultElement(element: GDataXMLElement) {
        // retrieve title
        //        var node: GDataXMLNode = element.childAtIndex(1)
        //        var title = self.parseElement(node.XMLString(), xpath: model_xpath_dict["title"]!)
        //        println("\(title)")
        // retrieve description
        let contentNode: GDataXMLNode = element.childAtIndex(5)
        var content = self.parseElement(contentNode.XMLString(), xpath: model_xpath_dict["content"]!)
        println("content is \(content)")
    }

    func parseElement(xmlString: String, xpath: String) -> String {
        var rx = NSRegularExpression.rx("<span.*span>", options: .CaseInsensitive);
        let result = xmlString.replace(rx, with: "")
        println("result is \(result)")

        let doc: GDataXMLDocument = GDataXMLDocument(HTMLString: result, error: nil)
        var nodeText = getNodeText(doc, xpath: xpath)

        return nodeText
    }

    func parseResultelement123(element: GDataXMLElement) {
        println("element is \(element)")
        //        let title_xpath = "div[1]/a[1]/text()"

        //        var title = getNodeText(element,xpath:model_xpath_dict["title"]!)
        var link = ""
        //        var content = getNodeText(element, xpath: model_xpath_dict["content"]!)

        //        println("\(title)")
        //        println("xxxxx")
        //        println("content is \(content)")

        //        let titleResults:NSArray = element.nodesForXPath(title_xpath, error: nil)
        //        if(titleResults.count == 1){
        //            let titleNode: GDataXMLNode = titleResults[0] as! GDataXMLNode
        //            title =  titleNode.XMLString()
        //            println("\(titleNode.XMLString())")
        //        }


    }


}