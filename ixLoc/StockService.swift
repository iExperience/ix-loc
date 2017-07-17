//
//  StockService.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/11.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import Foundation

class StockService {
    
    var delegate: StockServiceDelegate?
    
    func getLatestStockPriceForShare(share: String) {
        // Call Alamofire endpoints
        // completion: { response in ... }
        /*
         dele
        */
        delegate?.didReceiveLatestClosingPrice(latestClosingPrice: closingPrice)
    }
    
}
