//
//  ListItemsViewController.swift
//  ListerSwift
//
//  Created by Young Hoo Kim on 11/14/14.
//  Copyright (c) 2014 Young Hoo Kim. All rights reserved.
//

import UIKit

class ListItemsViewController: UITableViewController {
 
    var list:List!
    
    override func viewDidLoad() {
        self.title = "\(list.name) List"
    }
    
    func indexPathForView(view: UIView) -> NSIndexPath? {
        let viewOrigin = view.bounds.origin
        let viewLocation = tableView.convertPoint(viewOrigin, fromView: view)
        
        return tableView.indexPathForRowAtPoint(viewLocation)
    }
    
    // MARK: - Action
    
    func checkBoxTapped(sender:CheckBox) {
        if let indexPath = indexPathForView(sender) {
            
            let (fromIndex, toIndex) = list.toggleItem(indexPath.row)
            
            if fromIndex == toIndex {
                tableView.reloadData()
            } else {
                let targetRow = NSIndexPath(forRow: toIndex, inSection: 0)

                tableView.beginUpdates()
                tableView.moveRowAtIndexPath(indexPath, toIndexPath: targetRow)
                tableView.endUpdates()
                tableView.reloadRowsAtIndexPaths([targetRow], withRowAnimation: .Automatic)
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:CheckBoxCell! = tableView.dequeueReusableCellWithIdentifier("ItemCell") as? CheckBoxCell
        if (cell == nil) {
            cell = CheckBoxCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ItemCell")
        }
        
        //cell.textLabel.text = list.items[indexPath.row].text
        cell.configure(list.items[indexPath.row])
        cell.checkBox.addTarget(self, action: Selector("checkBoxTapped:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
}