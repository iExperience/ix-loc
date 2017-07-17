//
//  StockServiceDelegate.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/11.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import Foundation

protocol StockServiceDelegate {
    func didReceiveLatestClosingPrice(latestClosingPrice: Double)
}
