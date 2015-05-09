//
//  ViewController.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit
import Foundation

class SeearchViewController: UITableViewController{
    
    var searchArray:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ElanceScrapyFetcher().fetchHtml { (object, sucess) -> Void in
            if((sucess) != nil){
                self.refreshTableView(object as! NSMutableArray)
            }else{
                self.title = "Search Failure!"
            }
        }
    }
    
    func emptyTableView(){
        self.searchArray = NSMutableArray()
        self.tableView.reloadData()
    }
    
    func refreshTableView(searchArray:NSMutableArray){
        self.searchArray = searchArray
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:SearchTableViewCell = tableView.dequeueReusableCellWithIdentifier("searchCell", forIndexPath: indexPath) as! SearchTableViewCell
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: SearchTableViewCell, forRowAtIndexPath: NSIndexPath) {
        let data: HtmlResultData = self.searchArray[forRowAtIndexPath.row] as! HtmlResultData
        cell.configureCell(data)
    }
    
    //MARK: UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
}

