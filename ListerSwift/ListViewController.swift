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
        
        lists.append(List(name: "Home", category: "Category 1", color: UIColor.grayColor(), items: [
            ListItem(text: "Macbook"),
            ListItem(text: "Table"),
            ListItem(text: "4 Chairs"),
            ListItem(text: "TV", completed: true),
            ]))
        lists.append(List(name: "Home-2", category: "Category 1", color: UIColor.grayColor(), items: []))
        lists.append(List(name: "Book", category: "Category 2", color: UIColor.blueColor(), items: [
            ListItem(text: "Code Complete"),
            ListItem(text: "Cocoa Programming"),
            ]))
        lists.append(List(name: "Phone", category: "Category 2", color: UIColor.blueColor(), items: []))
        lists.append(List(name: "Work", category: "Category 2", color: UIColor.blueColor(), items: []))
        lists.append(List(name: "C3-1", category: "Category 3", color: UIColor.blueColor(), items: []))
        lists.append(List(name: "C3-2", category: "Category 3", color: UIColor.blueColor(), items: []))

    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 40.0
        }
        return 0.0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Category 1"
        } else if section == 2 {
            return "Category 2"
        } else if section == 3 {
            return "Result"
        }
        return nil
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 90.0
        } else if indexPath.section == 3 {
            return 120.0
        }
        return 45.0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 3
        } else if section == 3 {
            return 2
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        if indexPath.section == 0 {
            cell.textLabel.text = "First Cell"
        } else if indexPath.section == 1 {
            cell.textLabel.text = lists[indexPath.row].name
        } else if indexPath.section == 2 {
            cell.textLabel.text = lists[indexPath.row + 1].name
        } else if indexPath.section == 3 {
            cell.textLabel.text = "Result Cell"
        }
        
        //cell.configure(lists[indexPath.row])
        return cell
    }
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
    
    var listItemsViewController = ListItemsViewController(style: UITableViewStyle.Plain)
    listItemsViewController.list = lists[indexPath.row]
    self.navigationController?.pushViewController(listItemsViewController, animated: true)
    }*/
}