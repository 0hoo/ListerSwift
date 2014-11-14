import Foundation
import UIKit

class List {
    var color: UIColor
    var name: String
    var items: [ListItem]
    
    init(name: String, color: UIColor, items: [ListItem]) {
        self.name = name
        self.color = color
        self.items = items
    }
}