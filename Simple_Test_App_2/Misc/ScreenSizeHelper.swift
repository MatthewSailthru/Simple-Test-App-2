//
//  ScreenSizeHelper.swift
//  CarnivalSwiftStreamExamples
//
//  Created by Sam Jarman on 1/10/15.
//  Copyright (c) 2015 Carnival Mobile. All rights reserved.
//

import UIKit

class ScreenSizeHelper: NSObject {

    class func isIphone5orLess() -> Bool {
        return (UIScreen.main.bounds.size.width <= 320 || UIScreen.main.bounds.size.height <= 320)
    }
    
    class func textSmall() -> CGFloat {
        return 9.0
    }
    
    class func textNormal() -> CGFloat {
        return 12.0
    }
}
