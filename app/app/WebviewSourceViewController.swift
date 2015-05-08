//
//  WebviewSourceViewController.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation

class WebviewSourceViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlString = "\(elance_host)scrapy"
        let url:NSURL = NSURL(string: urlString)!
        
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        self.webView.delegate = self
        self.webView.loadRequest(request)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        let x = 0
        //        if let request:NSURLRequest = webView.request{
        //            let  requestValue:NSData = request.HTTPBody!
        //            let xxx:NSString = NSString(data: requestValue, encoding: NSASCIIStringEncoding)!
        //          let  htmlSource = xxx as String
        //
        //            println("htmlSource is \(htmlSource)")
        //        }
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        // Report the error inside the web view.
        let localizedErrorMessage = NSLocalizedString("An error occured:", comment: "")
        
        let errorHTML = "<!doctype html><html><body><div style=\"width: 100%%; text-align: center; font-size: 36pt;\">\(localizedErrorMessage) \(error.localizedDescription)</div></body></html>"
        
        webView.loadHTMLString(errorHTML, baseURL: nil)
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
}