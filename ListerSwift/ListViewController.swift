//
//  ViewController.swift
//  ListerSwift
//
//  Created by Young Hoo Kim on 11/14/14.
//  Copyright (c) 2014 Young Hoo Kim. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var lists:[List] = []

    override func viewDidLoad() {
        self.title = "Lister"
        
        lists.append(List(name: "Home", color: UIColor.grayColor(), items: [
            ListItem(text: "Macbook"),
            ListItem(text: "Table"),
            ListItem(text: "4 Chairs"),
            ListItem(text: "TV", completed: true),
        ]))
        lists.append(List(name: "Book", color: UIColor.blueColor(), items: [
            ListItem(text: "Code Complete"),
            ListItem(text: "Cocoa Programming"),
        ]))
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        cell.textLabel.text = lists[indexPath.row].name
        //cell.configure(lists[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var listItemsViewController = ListItemsViewController(style: UITableViewStyle.Plain)
        listItemsViewController.list = lists[indexPath.row]
        self.navigationController?.pushViewController(listItemsViewController, animated: true)
    }
}

