//
//  ViewController.swift
//  Simple_Test_App_2
//
//  Created by Matthew Tripodi on 11/18/21.
//

import UIKit
import SailthruMobile

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userIDTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        userIDTextField.delegate = self
        
        // For Loop that uses a timer to create a simple animation that looks like the title is being typed out.
        // NOT needed just looks cool.
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "Simple Test App 💎🙌"
        for letter in titleText {
            print(charIndex)
            print(letter)
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
    }
    
    //MARK: Functions
    // Capturing whatever is typed into the emailTextField as the user email
    func setUserEmail() {
        SailthruMobile().setUserEmail(emailTextField.text) { error in
            print("setUserEmail returned with possible error: \(String(describing: error))")
        }
    }
    
    // Capturing whatever is typed into the userIDTextField as the user ID
    func setUserID() {
        SailthruMobile().setUserId(userIDTextField.text) { (error) in
            print("setUserID returned with possible error: \(String(describing: error))")
        }
    }
    
    
    //MARK: IBActions
    @IBAction func inboxButtonTapped(_ sender: Any) {
        // Go to the inbox / message stream page when this button is tapped
        performSegue(withIdentifier: "toMessages", sender: self)
        // Logs an event called enteredInbox when the user taps this button
        SailthruMobile().logEvent("enteredInbox")
    }
    
    @IBAction func collectEmailTapped(_ sender: UIButton) {
        // Calling the setUserEmail function above which captures the email when this button is tapped
        setUserEmail()
        
        // Displaying an alert to let the user know the email has been captured
        let alert = UIAlertController(title: "Success!", message: "Your email has been collected", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func collectUserIDTapped(_ sender: UIButton) {
        // Calling the setUserID function above which captures the user ID when this button is tapped
        setUserID()
        
        // Displaying an alert to let the user know the user ID has been captured
        let alert = UIAlertController(title: "Success!", message: "Your User ID has been collected", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    //MARK: Dismissing Keyboard
    // To dismiss the keyboard when the user touches outside of the keyboard
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // To dismiss the keyboard when return is tapped
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

