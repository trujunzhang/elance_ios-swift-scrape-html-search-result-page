//
//  ElanceScrapyFetcher.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class ElanceScrapyFetcher: FetchProtocal {


    func fetchHtml(completeHandler: ObjectHandler) {
        let url = "https://www.elance.com/r/jobs/q-scrapy"
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
        println("html is \(html)")

        var err: NSError?
        var parser = HTMLParser(html: html, error: &err)
        if err != nil {
            println(err)
            exit(1)
        }

//        var bodyNode = parser.body?.findNodeById("jobSearchResults")

//        if let inputNodes = bodyNode?.findChildClasss("jobCard") {
//            for node in inputNodes {
//                println(node.contents)
//            }
//        }

        //        if let inputNodes = bodyNode?.findChildTags("a") {
        //            for node in inputNodes {
        //                println(node.contents)
        //                println(node.getAttributeNamed("href"))
        //            }
        //        }
    }

}