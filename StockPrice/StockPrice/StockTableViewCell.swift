//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Tejaswi Nemani on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var symbollabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var stock = ""
    var stockSymbol = ""
    var sendStockDelegate : SendStockDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func getStock(_ sender: Any) {
        let currentURL = getStockURL(stockSymbol)
        getStockData(currentURL).done { stockModel in
            stockModel.symbol = self.stockSymbol
            self.sendStockDelegate?.sendStockData(stockModel)
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
}
