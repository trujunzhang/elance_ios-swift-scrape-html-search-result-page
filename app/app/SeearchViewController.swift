//
//  ViewController.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class SeearchViewController: UITableViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        KatPHScrapyFetcher().fetchHtml { (object, sucess) -> Void in

        }

//        ObjectiveGumboHelper.fetchHtmlAndParse()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

