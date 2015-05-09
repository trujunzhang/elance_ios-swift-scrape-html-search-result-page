//
//  HtmlResultData.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class HtmlResultData: NSObject {
    var title = ""
    var link = ""
    var content = ""
    
    init(title:String,link:String,content:String){
        self.title = title
        self.link  = link
        self.content = content
    }
}