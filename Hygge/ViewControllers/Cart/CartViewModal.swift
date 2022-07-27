//
//  CartViewModal.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 11.07.2022.
//

import Foundation

protocol cartViewModalDelegate{
    
    func didFinishNetworkOperations()
    
    func didRetrieveError(_ error: Error)
    
    func didSuccessBuyCart()
    
}

class cartViewModal {
    
    private let network = Network()
    var products: [Product] = []
    var delegate: cartViewModalDelegate?
    
    func fetchProducts(){
        
        network.request(endpointType: .cart) { (result: Result<BaseResponse<CartReponse>, CustomError>) in
        
            self.didRetrieveResult(result)
        }
    }
    
    func buyProduct(){
        
        network.request(endpointType: .clearCart) { (result: Result<BaseResponse<CartReponse>, CustomError>) in
        
            self.didRetrieveResult(result)
            self.delegate?.didSuccessBuyCart()
        }
    }
    
    func removeProduct(id: Int){
        
        network.request(endpointType: .removeProduct(id: id)) { (result: Result<BaseResponse<CartReponse>, CustomError>) in
        
            self.didRetrieveResult(result)
        }
    }
    
    private func didRetrieveResult(_ result: Result<BaseResponse<CartReponse>, CustomError>){
        
        switch result{
            
        case.failure(let error):
            self.delegate?.didRetrieveError(error)
            
        case.success(let response):
            self.products = response.result?.products ?? []
            self.delegate?.didFinishNetworkOperations()
        }
    }
    
}
