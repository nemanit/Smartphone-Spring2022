//
//  ViewController.swift
//  ClassicTableView
//
//  Created by Tejaswi Nemani on 2/7/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tblView: UITableView!
    
    let arr = ["Noodles", "Vadapav","bhelpuri","pani puri","Burger"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
}

