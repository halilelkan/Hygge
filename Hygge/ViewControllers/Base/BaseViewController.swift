//
//  BaseViewController.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 28.05.2022.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "black")
        
        let cartButton = UIBarButtonItem(image: UIImage(named: "basket"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.showCartPage))
        cartButton.tintColor = UIColor(named: "black")
        navigationItem.rightBarButtonItem = cartButton
        
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = UIColor(named: "lightGreen")
        
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        
    }
    
    @objc private func showCartPage(){
        print("\(#function)")
        
        DispatchQueue.main.async {
            let cartPage = CartViewController()
            self.navigationController?.pushViewController(cartPage, animated: true)
        }
    }


}
