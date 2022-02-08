//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Tejaswi Nemani on 2/7/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    let images = ["Biryani", "ChanaMasala", "Dosa", "MalaiKofta", "SaagPaneer", "Jalfrezi", "KarahiPanner", "GarlicNaan", "Korma", "Samosa"]
    let imageNames = ["Biryani", "Chana Masala", "Dosa", "Malai Kofta", "Saag Paneer", "Jalfrezi", "Karahi Panner", "Garlic Naan", "Korma", "Samosa"]
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = imageNames[indexPath.row]
        
        return cell
    }

}

