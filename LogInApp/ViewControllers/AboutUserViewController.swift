//
//  AboutUserViewController.swift
//  LogInApp
//
//  Created by Egor Yakovin on 15.11.2022.
//

import UIKit

class AboutUserViewController: UIViewController {
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var cityOfBirth: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = user.person.name
        surname.text = user.person.surname
        age.text = String(user.person.age)
        cityOfBirth.text = user.person.cityOfBirth
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else {
            return
        }
        imageVC.user = user
    }
}
