//
//  CALayer+RuntimeAttribute.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/09.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit

extension CALayer {
    // 参照: http://qiita.com/hkm/items/79a98139329a62631ca9
    func setBorderIBColor (color: UIColor!)
    {
        self.borderColor = color.CGColor
    }
}
