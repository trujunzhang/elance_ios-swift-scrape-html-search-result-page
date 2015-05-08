//
//  DownloadHtmlHelper.m
//  appBDD
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

#import "DownloadHtmlHelper.h"

#import <AFNetworking/AFNetworking.h>

@implementation DownloadHtmlHelper


+(void)downlaodHtml:(NSString*) htmlUrl{
    NSURL *URL = [NSURL URLWithString:htmlUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [op start];
}


@end
