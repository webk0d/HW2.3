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
            performSegue(withIdentifier: "toWelcomeScreen", sender: UIButton.self)
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
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        super .touchesBegan(touches, with: event)
    }
    
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case UserNameTF where UserNameTF.text != "":
            PasswordTF.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            loginButton()
        }
        return false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.userNameLoginVC = UserNameTF.text
    }


    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let welcomeViewController = segue.source as? WelcomeViewController else { return }
        UserNameTF.text = welcomeViewController.clearTF
        PasswordTF.text = welcomeViewController.clearTF
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




