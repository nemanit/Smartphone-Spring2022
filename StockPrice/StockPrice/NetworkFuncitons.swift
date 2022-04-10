//
//  NetworkFuncitons.swift
//  StockPrice
//
//  Created by Tejaswi Nemani on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

    func getStockURL(_ stockSymbol : String) -> String{
        let url = "\(stockAPIURL)\(stockSymbol)?apikey=\(apiKey)"
        return url
    }

    func getStockData(_ url : String) -> Promise<StockModel>{
        
        return Promise<StockModel> { seal -> Void in
            
            AF.request(url).responseJSON { response in
            
                if response.error != nil {
                    seal.reject(response.error!)
                }
                
                let stockData = StockModel("", "")
                //get data here

                let stockArray = JSON(response.data!).arrayValue
                
                guard let stockJSON = stockArray.first else {return seal.fulfill(stockData)}
                
                stockData.name = stockJSON["name"].stringValue
                stockData.symbol = stockJSON["symbol"].stringValue
                stockData.price = stockJSON["price"].floatValue
                stockData.dayHigh = stockJSON["dayHigh"].floatValue
                stockData.dayLow = stockJSON["dayLow"].floatValue
                
                seal.fulfill(stockData)

            }// end of response

        }// end is return Promise
    }// end of function

