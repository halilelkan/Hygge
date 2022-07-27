//
//  ProductsDetailsViewController.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 28.05.2022.
//

import UIKit


class ProductsDetailsViewController: BaseViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    private let network = Network()
    private let id: Int
    
    init(productId: Int) {
        self.id = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchProdctDetails()
    }
    
    private func fetchProdctDetails () {
        
        
        network.request(endpointType: .productsDetails(id: self.id)) { (result: Result<BaseResponse<Product>, CustomError>) in
            
            switch result {
            case .success(let response):
                
                DispatchQueue.main.async {
                    
                    self.imageView.setImage(with: response.result?.productImage)
                    self.nameLabel.text = response.result?.productName
                    self.priceLabel.text = response.result?.newPrice?.toStringwithCurrency
                }
                
            case .failure(let error):
                print(error.message)
            }
        }
    }

    
    @IBAction func actionStoresButton(_ sender: Any) {
        DispatchQueue.main.async {
            let stores = StoresViewController()
            self.navigationController?.pushViewController(stores, animated: true)
        }
    }
    
    @IBAction func actionAddToCartButton(_ sender: Any) {
        network.request(endpointType: .addToCart(productId: id)) { (result: Result<BaseResponse<CartReponse>, CustomError>) in
            
            switch result {
                
            case.failure(let error):
                print(error.message)
                
            case.success(let response):
                
                DispatchQueue.main.async {
                    
                    let popup = PopupViewController(text: "Ürününüz sepete başarılı bir şekilde eklendi.", actionButton: self.actionOkButton)
                    popup.modalTransitionStyle = .crossDissolve
                    popup.modalPresentationStyle = .overCurrentContext
                    self.navigationController?.present(popup, animated: true, completion: nil)
                    
                }
            }
        }
    }

    
    private func actionOkButton(){
        
        DispatchQueue.main.async {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
