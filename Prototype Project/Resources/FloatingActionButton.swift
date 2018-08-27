//
//  FloatingActionButton.swift
//  Prototype Project
//
//  Created by Bhushan Joshi on 2018-08-11.
//  Copyright © 2018 Bhushan Joshi. All rights reserved.
//

import UIKit

class FloatingActionButton: UIButtonX {

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        UIView.animate(withDuration: 0.3) {
            if self.transform == .identity{
                //identity means the default value of transform . Initial value of transform whcih is null at beginning
                self.transform = CGAffineTransform(rotationAngle: 45 * (.pi / 180))
                self.backgroundColor = #colorLiteral(red: 0.8196, green: 0.2196, blue: 0.3333, alpha: 1) /* #d13855 */
            }
            else{
                //identity means the default value of transform . Initial value of transform whcih is null at beginning
                self.transform = .identity
                self.backgroundColor = #colorLiteral(red: 0.9412, green: 0.251, blue: 0.3843, alpha: 1) /* #f04062 */
            }
        }
        
       
        
        return super.beginTracking(touch, with: event)
    }
}
