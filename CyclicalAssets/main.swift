//
//  main.swift
//  CyclicalAssets
//
//  Created by David on 13/01/2016.
//  Copyright © 2016 David. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
print("Created \(bob)")

var laptop: Asset? = Asset(name: "Shiny laptop", value: 1500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue backpack", value: 45.0)

bob?.takeOwnershipOfAsset(laptop!)
bob?.takeOwnershipOfAsset(backpack!)
print(bob?.assets)
bob?.loseOwnershipOfAsset(backpack!)
print(bob?.assets)
print("While bob's alive the owner of laptop is: \(laptop!.owner)")
bob = nil
print("the bob variable is now \(bob)")
print("When bob's dead the owner of laptop is: \(laptop!.owner)")

laptop = nil
hat = nil
backpack = nil

