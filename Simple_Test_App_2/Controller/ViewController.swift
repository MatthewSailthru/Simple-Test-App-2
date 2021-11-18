//
//  ViewController.swift
//  Simple_Test_App_2
//
//  Created by Matthew Tripodi on 11/18/21.
//

import UIKit
import SailthruMobile

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userIDTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For Loop that uses a timer to create a simple animation that looks like the title is being typed out.
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
    func setUserEmail() {
        SailthruMobile().setUserEmail(emailTextField.text) { error in
            print("setUserEmail returned with possible error: \(error)")
        }
    }
    
    func setUserID() {
        SailthruMobile().setUserId(userIDTextField.text) { (error) in
            print("setUserID returned with possible error: \(error)")
        }
    }
    
    
    //MARK: IBActions
    @IBAction func inboxButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toMessages", sender: self)
        SailthruMobile().logEvent("enteredInbox")
    }
    
    @IBAction func collectEmailTapped(_ sender: UIButton) {
        setUserEmail()
    }
    
    @IBAction func collectUserIDTapped(_ sender: UIButton) {
        setUserID()
    }
}

