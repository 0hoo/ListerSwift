import Foundation

class ListItem {
    var text: String
    var isComplete: Bool
    
    init(text: String, completed: Bool = false) {
        self.text = text
        self.isComplete = completed
    }
}