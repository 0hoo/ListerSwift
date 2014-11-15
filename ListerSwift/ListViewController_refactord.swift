//
//  ViewController.swift
//  ListerSwift
//
//  Created by Young Hoo Kim on 11/14/14.
//  Copyright (c) 2014 Young Hoo Kim. All rights reserved.
//

import UIKit

class ListViewModel {
    enum ListSection {
        case HeaderSection(Int)
        case ListSection(String, Int)
        case ResultSection(Int)
    }
    
    var listsByCategory:[String:[List]] = [:]
    var sections:[ListSection] = []
    
    func loadList(lists:[List]) {
        sections.append(.HeaderSection(1))
        for list in lists {
            if listsByCategory[list.category] == nil {
                listsByCategory[list.category] = [list]
            } else {
                listsByCategory[list.category]!.append(list)
            }
        }
        for category in listsByCategory.keys {
            sections.append(.ListSection(category, listsByCategory[category]!.count))
        }
        sections.append(.ResultSection(2))
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch sections[section] {
        case .HeaderSection(let rows):
            return rows
        case .ListSection(_, let rows):
            return rows
        case .ResultSection(let rows):
            return rows
        }
    }
    
    func heightForHeaderInSection(section: Int) -> CGFloat {
        switch sections[section] {
        case .HeaderSection:
            return 0.0
        default:
            return 40.0
        }
    }
    
    func titleForHeaderInSection(section: Int) -> String? {
        switch sections[section] {
        case .ListSection(let category, _):
            return category
        case .ResultSection:
            return "Result"
        default:
            return nil
        }
    }
    
    func heightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        switch sections[indexPath.section] {
        case .HeaderSection:
            return 90.0
        case .ResultSection:
            return 120.0
        default:
            return 45.0
        }
    }
}

class ListViewController: UITableViewController {
    
    var viewModel = ListViewModel()

    override func viewDidLoad() {
        self.title = "Lister"
        viewModel.loadList([
            List(name: "Home", category: "Category 1", color: UIColor.grayColor(), items: [
                ListItem(text: "Macbook"),
                ListItem(text: "Table"),
                ListItem(text: "4 Chairs"),
                ListItem(text: "TV", completed: true),
            ]),
            List(name: "Book", category: "Category 2", color: UIColor.blueColor(), items: [
                ListItem(text: "Code Complete"),
                ListItem(text: "Cocoa Programming"),
            ]),
            List(name: "Phone", category: "Category 2", color: UIColor.blueColor(), items: []),
            List(name: "Work", category: "Category 2", color: UIColor.blueColor(), items: []),
            List(name: "Cafe", category: "Category 3", color: UIColor.blueColor(), items: [])
        ])
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForHeaderInSection(section)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderInSection(section)
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return viewModel.heightForRowAtIndexPath(indexPath)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        switch viewModel.sections[indexPath.section] {
        case .HeaderSection:
            cell.textLabel.text = "First Cell"
        case .ListSection(let category, _):
            cell.textLabel.text = viewModel.listsByCategory[category]![indexPath.row].name
        case .ResultSection:
            cell.textLabel.text = "Result Cell"
        }

        return cell
    }
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var listItemsViewController = ListItemsViewController(style: UITableViewStyle.Plain)
        listItemsViewController.list = lists[indexPath.row]
        self.navigationController?.pushViewController(listItemsViewController, animated: true)
    }*/
}

