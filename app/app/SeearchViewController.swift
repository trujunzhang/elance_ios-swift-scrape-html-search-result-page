//
//  ViewController.swift
//  app
//
//  Created by djzhang on 5/8/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit
import Foundation

class SeearchViewController: UITableViewController,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var searchArray:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        searchBar.delegate = self
        
        searchBar.text = "scrapy"
        
        self.retrieveHtml(searchBar.text)
    }
    
    func retrieveHtml(search:String){
        ElanceScrapyFetcher().fetchHtml(search, completeHandler: { (object, sucess) -> Void in
            if((sucess) != nil){
                self.refreshTableView(object as! NSMutableArray)
            }else{
                self.title = "Search Failure!"
            }
        })
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
         let data: HtmlResultData = self.searchArray[indexPath.row] as! HtmlResultData
        
        let viewController: WebviewSourceViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WebviewSourceViewController") as! WebviewSourceViewController
        
        viewController.title = data.title
        viewController.urlString = data.link
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    
    
    // MARK: UISearchBarDelegate
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.retrieveHtml(searchBar.text)
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    
    
}

