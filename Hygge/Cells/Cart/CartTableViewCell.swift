//
//  CartTableViewCell.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 11.07.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    var onActionRemoveButton : (() -> Void)?
    
    private let viewModal = cartViewModal()

    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productPriceLabel: UILabel!
    
    func configure(with product: Product){
        self.productImageView.setImage(with: product.productImage)
        self.productNameLabel.text = product.productName
        self.productPriceLabel.text = product.newPrice?.toStringwithCurrency
    }
    
    @IBAction func actionRemoveButton(_ sender: Any) {
        
        print(#function)
        self.onActionRemoveButton?()
    }
    
}
