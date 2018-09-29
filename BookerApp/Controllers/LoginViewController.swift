//
//  LoginViewController.swift
//  BookerApp
//
//  Created by Ka ka Tam on 29/09/2018.
//  Copyright © 2018 Ka ka Tam. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self
        password.delegate = self
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "goToHome1", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
