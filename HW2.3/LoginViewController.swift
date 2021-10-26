//
//  LoginViewController.swift
//  HW2.3
//
//  Created by Сергей Чумаков on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var UserNameTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    private let userName = "User"
    private let userPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func loginButton() {
        
    }
    

    @IBAction func forgotUserName() {
    }
    
    
    @IBAction func forgotPassword() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.userNameLoginVC = UserNameTF.text
    }
    
    
    
    

}
