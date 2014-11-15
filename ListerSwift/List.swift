import Foundation
import UIKit

class List {
    var color: UIColor
    var name: String
    var category: String
    var items: [ListItem]
    
    init(name: String, category:String, color: UIColor, items: [ListItem]) {
        self.name = name
        self.category = category
        self.color = color
        self.items = items
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func toggleItem(index:Int) -> (fromIndex: Int, toIndex: Int) {
        let listItem = items[index]
        listItem.isComplete = !listItem.isComplete
        items.removeAtIndex(index)

        var toIndex:Int
        if listItem.isComplete {
            toIndex = self.items.count
        } else  {
            toIndex = separatorIndex
        }
        items.insert(listItem, atIndex: toIndex)
        
        return (index, toIndex)
    }
    
    var separatorIndex: Int {
        if let firstCompleteItemIndex = indexOfFirstCompletedItem {
            return firstCompleteItemIndex
        }
        
        return items.count
    }
    
    var indexOfFirstCompletedItem: Int? {
        for (current, item) in enumerate(items) {
            if item.isComplete {
                return current
            }
        }
        
        return nil
    }
}