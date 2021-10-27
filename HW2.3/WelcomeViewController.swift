//
//  WelcomeViewController.swift
//  HW2.3
//
//  Created by Сергей Чумаков on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var WelcomeLabel: UILabel!
    
    
    var userNameLoginVC: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeLabel.text =  "Welcome, " + userNameLoginVC

    }
    
    @IBAction func logoutButton() {
        dismiss(animated: true)
    }
    
    
}
