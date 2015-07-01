//
//  Utilities.swift
//  Combat
//
//  Created by Qingwei Lan on 6/24/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import Foundation

class Utilities
{
    // public values
    enum ValueType {
        case HP, MP, Speed, Damage, Defense
    }
    
    // list all values required
    private struct Bound {
        let lower: UInt32
        let upper: UInt32
    }
    private struct ValueBounds {
        static let HP = Bound(lower: 350, upper: 450)
        static let MP = Bound(lower: 150, upper: 250)
        static let Speed = Bound(lower: 100, upper: 150)
        static let Damage = Bound(lower: 200, upper: 250)
        static let Defense = Bound(lower: 75, upper: 125)
    }
    
    // generates random growth in range: [1.0, 2.0]
    class func randomGrowth() -> Float {
        return Float(1.0 + Float(arc4random() % 1000) / Float(1000))
    }
    
    // generates random values for different types specified
    class func randomValue(#type: ValueType, growth: Float) -> Int32 {
        switch type {
        case .HP: return randomValue(lower: ValueBounds.HP.lower, upper: ValueBounds.HP.upper, growth: growth)
        case .MP: return randomValue(lower: ValueBounds.MP.lower, upper: ValueBounds.MP.upper, growth: growth)
        case .Speed: return randomValue(lower: ValueBounds.Speed.lower, upper: ValueBounds.Speed.upper, growth: growth)
        case .Damage: return randomValue(lower: ValueBounds.Damage.lower, upper: ValueBounds.Damage.upper, growth: growth)
        case .Defense: return randomValue(lower: ValueBounds.Defense.lower, upper: ValueBounds.Defense.upper, growth: growth)
        }
    }
    
    // generates random element
    class func randomElement() -> Int32 {
        return Int32(arc4random() % 5)
    }
    
    // generates random value in range [lower, upper] * growth
    private class func randomValue(#lower: UInt32, upper: UInt32, growth: Float) -> Int32 {
        return Int32(Float(lower) + Float(arc4random() % (upper - lower)) * growth)
    }
}