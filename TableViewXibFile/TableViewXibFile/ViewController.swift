//
//  ViewController.swift
//  TableViewXibFile
//
//  Created by Tejaswi Nemani on 2/15/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name : String?
    
 
    let images = ["Bhelpuri","Biryani","burger","chai","coffee","Dosa","Noodles","Panipuri","pizza","samosa"]
    let imageLabel = ["Bhelpuri","Biryani","burger","chai","coffee","Dosa","Noodles","Panipuri","pizza","samosa"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImage.text = imageLabel[indexPath.row]
        
        return cell
    }
}

