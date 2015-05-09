//
//  FetchProtocal.swift
//  appBDD
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

typealias ObjectHandler = (AnyObject!, Bool!) -> Void

protocol FetchProtocal{
    
    func getHost() -> String
    
    func fetchHtml(search:String,completeHandler: ObjectHandler)
    
    func parseHtml(html:String) -> NSMutableArray
    
}