//
//  CartViewController.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 11.07.2022.
//

import UIKit

class CartViewController: BaseViewController {

    private let viewModal = cartViewModal()
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModal.delegate = self

        viewModal.fetchProducts()
        
    }
    
    @IBAction private func actionBuyButton(_ sender: Any) {
        
        viewModal.buyProduct()
        }
    }
    


extension CartViewController: cartViewModalDelegate {
    
    func didSuccessBuyCart() {
        
        DispatchQueue.main.async {
            
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func didFinishNetworkOperations() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func didRetrieveError(_ error: Error) {
        print(error.localizedDescription)
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModal.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        
        let product = viewModal.products[indexPath.row]
        
        cell.configure(with: product)
        
        cell.onActionRemoveButton = {
            guard let id = product.id else {return }
            self.viewModal.removeProduct(id: id)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) -> Int {
        return 140
    }
}
