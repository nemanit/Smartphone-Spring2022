//
//  ProtocolSendStockData.swift
//  StockPrice
//
//  Created by Tejaswi Nemani on 4/10/22.
//

import Foundation
protocol SendStockDelegate {
    func sendStockData(_ stockModel : StockModel)
}
