//
//  ViewController.swift
//  StockPrice
//
//  Created by Tejaswi Nemani on 4/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , SendStockDelegate{
    
    let stocks = ["AAPL", "FB", "GOOG", "MSFT", "AMZN"]
    var stocksModel: [StockModel]?

    @IBOutlet weak var lbname: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var lbprice: UILabel!
    @IBOutlet weak var lbsymbol: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksModel = initializeStocks()
        
    }
    
    func initializeStocks() -> [StockModel]{
        let aaple = StockModel("Apple", "AAPL");
        let facebook = StockModel("Facebook", "FB");
        let google = StockModel("Google", "GOOG");
        let microsoft = StockModel("Microsoft", "MSFT");
        let amazon = StockModel("Amazon", "AMZN");

        var modelArr = [StockModel]()
        
        modelArr.append(aaple)
        modelArr.append(facebook)
        modelArr.append(google)
        modelArr.append(microsoft)
        modelArr.append(amazon)

        return modelArr
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
        
        guard let stockModel = stocksModel?[indexPath.row] else {return cell}

        cell.symbollabel.text = stockModel.symbol
        cell.stockSymbol = stockModel.symbol
        cell.stock = stockModel.name
        cell.sendStockDelegate = self
        
        return cell

    }
    
    func sendStockData(_ stockModel: StockModel) {
        lbname.text = stockModel.name
        lbsymbol.text = stockModel.symbol
        lbprice.text = "\(stockModel.price)"
        
    }
    
}

