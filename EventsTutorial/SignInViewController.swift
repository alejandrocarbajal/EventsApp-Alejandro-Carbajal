//
//  SignInViewController.swift
//  EventsApp
//
//  Created by Alejandro Carbajal on 9/26/18.
//  Copyright © 2018 Alejandro Carbajal. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    var isSignIn:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        //flip the boolean
        isSignIn = !isSignIn
        
        //check the bool and set the button and labels
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        // TO DO: do some form validation on the email and password
        
        
        if let email = emailTextField.text, let pass = passwordTextField.text
            {
                    //check if it's sign in or register
            if isSignIn {
                    //Sign in the user with firebase
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    
                    //check that user isn't nil
                    if user != nil {
                        //user is found, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                }
            }
                    else {
                         //error, check error and show message
                        
                        Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                            guard (user?.user) != nil else { return }
                            
                            //check that user isn't nil
                            if user != nil {
                            //user is found, go to home screen
            }
                })
            
                            
        }
}
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //dissmiss the keyboard when the view is tapped on
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

}

