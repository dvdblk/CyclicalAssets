//
//  Person.swift
//  CyclicalAssets
//
//  Created by David on 13/01/2016.
//  Copyright © 2016 David. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    var accountant = Accountant()
    var assets = [Asset]()
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in
            
            self?.netWorthDidChange(netWorth)
            return
        }
    }
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnershipOfAsset(asset: Asset) {
        asset.owner = self
        assets.append(asset)
        accountant.gainedNewAsset(asset)
    }
    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
    func loseOwnershipOfAsset(asset: Asset) {
        asset.owner = nil
        let result = assets.filter{ $0.description != asset.description }
        accountant.lostAsset(asset)
        assets = result
    }
}