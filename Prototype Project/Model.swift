
/*
 This is the model class that holds your data.
 This model is what is shown in a tableview, collectionview, pickerview row, etc.
 */

import UIKit

class Model {
    var title = ""
    var subTitle = ""
    var image: [UIImage?]
    var time = ""
    var clock = ""
    
    init(title: String, subTitle: String, image: [UIImage?], time: String, clock: String) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.time = time
        self.clock = clock
    }
}
