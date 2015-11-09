//
//  alphaTransitionButton.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/09.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit

class AlphaTransitionButton: UIButton {

    override var highlighted:Bool {
        didSet {
            if self.highlighted {
                self.alpha = 0.1
//                
//                if let backgroundColor = self.backgroundColor {
//                    self.backgroundColor = backgroundColor.colorWithAlphaComponent(0.1)
//                }
//                
//                if let borderColor = self.layer.borderColor {
//                    self.layer.borderColor = UIColor(CGColor: borderColor).colorWithAlphaComponent(0.1).CGColor
//                }
            }
            else {
                UIView.transitionWithView(self,
                    duration: 0.5,
                    options: [UIViewAnimationOptions.CurveEaseInOut],
                    animations: { () -> Void in
                        self.alpha = 1.0
//                        if let backgroundColor = self.backgroundColor {
//                            self.backgroundColor = backgroundColor.colorWithAlphaComponent(1.0)
//                        }
//                        
//                        self.layer.borderColor = UIColor(CGColor: self.layer.borderColor!).colorWithAlphaComponent(1.0).CGColor
//                        
//                        if let borderColor = self.layer.borderColor {
//                            self.layer.borderColor = UIColor(CGColor: borderColor).colorWithAlphaComponent(1.0).CGColor
//                        }
                    },
                    completion: nil)
            }
        }
    }

}
