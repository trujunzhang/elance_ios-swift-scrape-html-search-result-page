//
//  WebviewSourceViewController.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import UIKit

class WebviewSourceViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        urlString =  urlString.replace("\"", withString: "").replace("href=", withString: "")
        
        let request: NSURLRequest = NSURLRequest(URL: NSURL(string: urlString)!)
        
        self.webView.loadRequest(request)
    }
    
}