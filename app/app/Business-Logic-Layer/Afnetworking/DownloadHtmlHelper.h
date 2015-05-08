//
//  DownloadHtmlHelper.h
//  appBDD
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HtmlResponseBlock)(NSObject *respObject, NSError *error);


@interface DownloadHtmlHelper : NSObject

+(void)downlaodHtml:(NSString*) htmlUrl completeHandler:(HtmlResponseBlock)block;

@end
