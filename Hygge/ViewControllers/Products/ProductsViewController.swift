//
//  ProductsViewController.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 28.05.2022.
//

import UIKit

class ProductsViewController: BaseViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
     private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        fetcProducts()
        
    }
    
    func fetcProducts () {
        
        let network = Network()
        
        network.request(endpointType: .products) {(result: Result<BaseResponse<[Product]>, CustomError>) in
            
            switch result {
            case .success(let response):
                
                self.products = response.result ?? []
                print(response.result)
                
                DispatchQueue.main.async {
                    
                    self.collectionView.reloadData()  
                }
                
            case .failure(let error):
                print(error.message)
            }
        }
    }

}
extension ProductsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        cell.configur(with: products[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let id = products[indexPath.row].id else {return}
        let productDetails = ProductsDetailsViewController(productId: id)
        
        DispatchQueue.main.async {
            
            self.navigationController?.pushViewController(productDetails, animated: true)
        }
        
        print(products[indexPath.row].productName)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (self.view.frame.width - 30) / 2
        let heigth: CGFloat = 2 * width
        
        return CGSize(width: width, height: heigth)
    }
}


