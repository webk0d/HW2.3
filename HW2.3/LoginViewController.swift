//
//  LoginViewController.swift
//  HW2.3
//
//  Created by Сергей Чумаков on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate  {
    
    
    @IBOutlet weak var UserNameTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    private let userName = "User"
    private let userPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserNameTF.delegate = self
        PasswordTF.delegate = self
    }
    
    
    @IBAction func loginButton() {
    
        if (UserNameTF.text == userName && PasswordTF.text == userPassword ) {
            loginUserShowWelcome()
        } else if UserNameTF.text == userName {
            showText(title: "Invalid login or password", message: "Please, enter correct login and password")
            PasswordTF.text = ""
            
        } else if PasswordTF.text == userPassword {
            showText(title: "Invalid login or password", message: "Please, enter correct login and password")
            UserNameTF.text = ""
        } else {
            showText(title: "Invalid login or password", message: "Please, enter correct login and password")
            UserNameTF.text = ""
            PasswordTF.text = ""
        }
        
    }
    

    @IBAction func forgotUserName() {
        showText(title: "Oops", message: "Your name is User")
    }
    
    
    @IBAction func forgotPassword() {
        showText(title: "Oops", message: "Your password is Password")
    }
    
    
    private func loginUserShowWelcome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let welcomeViewController = storyboard.instantiateViewController(identifier: "WelcomeViewController") as? WelcomeViewController else { return }
        welcomeViewController.userNameLoginVC = UserNameTF.text
        show(welcomeViewController, sender: nil)
        UserNameTF.text = ""
        PasswordTF.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        super .touchesBegan(touches, with: event)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case UserNameTF:
            PasswordTF.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            loginButton()
        }
        return false
    }


}

extension LoginViewController {
    private func showText(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}




