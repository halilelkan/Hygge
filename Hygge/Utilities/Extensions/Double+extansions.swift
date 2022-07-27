//
//  Double+extantions.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 28.05.2022.
//

import Foundation

extension Double {
    
    var toString: String {
        return String(self)
    }
    
    var toStringwithCurrency: String {
        return self.toString + "TL"
    }
}
