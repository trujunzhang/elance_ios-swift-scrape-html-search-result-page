//
//  GDataHtmlHelper.m
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import "GDataHtmlHelper.h"

#import "GDataXMLNode.h"

@implementation GDataHtmlHelper


- (void)startHTMLParsing:( NSData * )data {
    GDataXMLDocument *doc = [[GDataXMLDocument alloc]initWithHTMLData:data error:NULL];
    if (doc) {
        [[doc rootElement] XMLString];
    }
}

@end
