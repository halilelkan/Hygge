//
//  PopupViewController.swift
//  Hygge
//
//  Created by halil ibrahim Elkan on 11.07.2022.
//

import UIKit

class PopupViewController: UIViewController {

    
    @IBOutlet private weak var titleLablel: UILabel!
    
    private let text: String
    let actionButton: () -> Void
    
    init(text: String, actionButton: @escaping () -> Void){
        self.text = text
        self.actionButton = actionButton
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLablel.text = text
    }


    @IBAction private func actionOkButton(_ sender: Any) {
        
        self.dismiss(animated: true)
        actionButton()
    }
    

}
