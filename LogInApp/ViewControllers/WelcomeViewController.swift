//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Egor Yakovin on 11.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(name ?? "")!"
    }

}
