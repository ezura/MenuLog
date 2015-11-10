//
//  LunchBox.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/10.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import Foundation
import RealmSwift

class LunchBox: Object {
    
    dynamic private var imageURI = ""
    
    private var image: UIImage? {
        get {
            return _image
        }
        set(image) {
            _image = image
        }
    }
    lazy var _image: UIImage? = UIImage(contentsOfFile: self.imageURI)
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
