//
//  GetNameViewController.swift
//  ProtocolAndDelegate
//
//  Created by Tejaswi Nemani on 2/22/22.
//

import UIKit

protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName: String)
    func setWelcomeText(welcomeText: String)
}

class GetNameViewController: UIViewController {
    
    var firstName : String?
    var lastName : String?

    var sendFirstNameAndLastNameDelegate : SendFirstAndLastNameDelegate?
        
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let firstName = firstName else {return}
        guard let lastName = lastName else {return}
        
        txtFirstName.text = firstName
        txtLastName.text = lastName
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveName(_ sender: Any) {
        
        guard let first = txtFirstName.text else {return}
        guard let last = txtLastName.text else {return}
        
        sendFirstNameAndLastNameDelegate?.setFirstAndLastName(firstName: first, lastName: last)
        sendFirstNameAndLastNameDelegate?.setWelcomeText(welcomeText: "Welcome \(first), \(last)")
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
