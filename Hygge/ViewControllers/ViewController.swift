//
//  ViewController.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 21.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let network = Network()
        network.request(endpointType: EndpointType.products) {(result: Result<BaseResponse<[Product]>, CustomError>) in
            
            switch result {
            case .success(let success):
                
                let quantity = success.result?.count ?? 0
                print(quantity)
                print(success.result)
            case .failure(let failure):
                print("")
            }
        }
        
    }

}

