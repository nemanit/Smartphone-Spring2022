//
//  ViewController.swift
//  ProtocolAndDelegate
//
//  Created by Tejaswi Nemani on 2/22/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate {
   
    
       
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getNameFromUser(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName"{
            let getNameVC = segue.destination as! GetNameViewController
            guard let firstName = lblFirstName.text else { return}
            guard let lastName = lblLastName.text else { return}

            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
            
            getNameVC.sendFirstNameAndLastNameDelegate = self
        }
    }
    
    func setFirstAndLastName(firstName: String, lastName: String) {
        lblFirstName.text = firstName
        lblLastName.text = lastName
    }
    
    func setWelcomeText(welcomeText: String) {
        lblWelcome.text = welcomeText
    }
}


