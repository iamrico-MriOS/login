//
//  ViewController.swift
//  Login
//
//  Created by Rico Bryant on 2/6/19.
//  Copyright © 2019 Rico Bryant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else{
            fatalError("it isn't a button")
        }
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUserNameButton {
            segue.destination.navigationItem.title = "Forgot User Name"
        }else{
            segue.destination.navigationItem.title = "Welcome \(userName.text ?? "")"
        }
    }
    
    @IBAction func forgotUserNameOrPasswordButtonPressed(_ sender: UIButton) {
        if forgotPasswordButton.isTouchInside {
            performSegue(withIdentifier: "ForgottenUsernameOrPassword",sender: forgotPasswordButton)
        }else {
            performSegue(withIdentifier: "ForgottenUsernameOrPassword",sender: forgotUserNameButton)
        }
    }
}

