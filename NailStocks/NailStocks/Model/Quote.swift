//
//  QuoteShort.swift
//  NailStocks
//
//  Created by Tejaswi Nemani on 3/2/22.
//

import Foundation

class Quote{
    var symbol : String = ""
    var name : String = ""
    var price : Float = 0.0
    var changesPercentage : Float = 0.0
    var change : Float = 0.0
    var dayLow : Float = 0.0
    var dayHigh : Float = 0.0
    var yearHigh : Float = 0.0
    var yearLow : Float = 0.0
    var marketCap : Double = 0.0
    var priceAvg50 : Float = 0.0
    var priceAvg200 : Float = 0.0
    var volume : Int = 0
    var avgVolume : Int = 0
    var exchange : String = ""
    var open : Float = 0.0
    var previousClose : Float = 0.0
    var eps : Float = 0.0
    var pe : Float = 0.0
    var earningsAnnouncement : String = ""
    var sharesOutstanding : Int = 0
    var timestamp : Int = 0
}

