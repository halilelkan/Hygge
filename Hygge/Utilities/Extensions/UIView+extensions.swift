//
//  UIView+extensions.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 28.05.2022.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
