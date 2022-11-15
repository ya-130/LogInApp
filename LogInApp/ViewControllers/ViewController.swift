//
//  ViewController.swift
//  LogInApp
//
//  Created by Egor Yakovin on 11.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTestField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUserData()
    
    @IBAction func ForgotUsernamePressed() {
        ShowAlert(title: "Your username is \"\(user.username)\"")
    }
    @IBAction func ForgotPasswordPressed() {
        ShowAlert(title: "Your password is \"\(user.password)\"")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else
        { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = user.person.name
            } else if let navigationController = viewController as? UINavigationController {
                guard let aboutUserVC = navigationController.topViewController as? AboutUserViewController else { return }
                aboutUserVC.user = user
            }
        }
        
    }
    
    @IBAction func LogInButtonPressed() {
        guard loginTestField.text == user.username, passwordTextField.text == user.password else {
            ShowAlert(
                title: "Error",
                message: "Your login or password are incorrect"
            )
            loginTestField.text = ""
            passwordTextField.text = ""
            return
        }
    }
    
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        loginTestField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: Alert Controller
extension ViewController {
    private func ShowAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
