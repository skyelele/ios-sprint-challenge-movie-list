import UIKit

class Movie {
    var title: String
    var isSeen: Bool
    
    init(title: String, isSeen: Bool = true) {
        self.title = title
        self.isSeen = isSeen
    }
}
