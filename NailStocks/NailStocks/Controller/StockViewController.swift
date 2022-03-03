//
//  StockViewController.swift
//  NailStocks
//
//  Created by Tejaswi Nemani on 2/20/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire
 
class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    
    @IBOutlet weak var lblStockMarketCap: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func getStockMarketCap(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else {return }
        
        
        let url = "\(QuoteURL)\(symbol.uppercased())?apikey=\(apiKey)"
        
        print (url)
        
        SwiftSpinner.show("Getting Stock Market Cap for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            //if i am here then i have got the data
            
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else { return}
            
            print(stock)
            let quote = Quote()
            quote.symbol = stock["symbol"].stringValue
            quote.name = stock["name"].stringValue
            quote.price = stock["price"].floatValue
            quote.changesPercentage = stock["changesPercentage"].floatValue
            quote.change = stock["change"].floatValue
            quote.dayLow = stock["dayLow"].floatValue
            quote.dayHigh = stock["dayHigh"].floatValue
            quote.yearHigh = stock["yearHigh"].floatValue
            quote.yearLow = stock["yearLow"].floatValue
            quote.marketCap = stock["marketCap"].doubleValue
            quote.priceAvg50 = stock["priceAvg50"].floatValue
            quote.priceAvg200 = stock["priceAvg200"].floatValue
            quote.volume = stock["volume"].intValue
            quote.avgVolume = stock["avgVolume"].intValue
            quote.exchange = stock["exchange"].stringValue
            quote.open = stock["open"].floatValue
            quote.previousClose = stock["previousClose"].floatValue
            quote.eps = stock["eps"].floatValue
            quote.pe = stock["pe"].floatValue
            quote.earningsAnnouncement = stock["earningsAnnouncement"].stringValue
            quote.sharesOutstanding = stock["sharesOutstanding"].intValue
            quote.timestamp = stock["volume"].intValue
            

            self.lblStockMarketCap.text = "\(quote.symbol) : \(Int(quote.marketCap/1000000)) M$"
    
        }
    }
    
}
