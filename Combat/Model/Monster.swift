//
//  Monster.swift
//  Combat
//
//  Created by Qingwei Lan on 6/25/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import Foundation

class Monster
{
    // chosen action
    var action: Constants.Action = .Attack
    
    // chosen skill, can be nil
    var skill: Skill? = nil
    
    // used for display only
    let name: String
    let element: Constants.MonsterType
    let level: Int32
    let growth: Float
    
    // read only identity info
    private(set) var num: Int32
    private(set) var species: String
    private(set) var types: [Constants.MonsterType]
    private(set) var genderRatio: (Int32, Int32)
    
    // evolution system
    private(set) var preEvoSpecies: String
    private(set) var postEvoSpecies: String
    private(set) var evoLevel: Int32
    
    // read only battle properties
    private(set) var hp: Int32 { didSet { if hp <= 0 { hp = 0; setDead() } } }
    private(set) var mp: Int32
    private(set) var speed: Int32
    private(set) var attack: Int32
    private(set) var defense: Int32
    private(set) var spAttack: Int32
    private(set) var spDefense: Int32
    
    
    private(set) var isDead: Bool = false
    
    // read only skillset
    private(set) var skills = [Skill]()
    
    // initializer with all properties
    // designated initializer
    init(name: String, element: Int32, growth: Float, level: Int32, hp: Int32, mp: Int32, speed: Int32, attack: Int32, defense: Int32, skills: [Int32])
    {
        /* set constant display properties */
        self.name = name
        self.element = Constants.MonsterType(rawValue: element)!
        self.level = level
        self.growth = growth
        
        /* set battle properties */
        self.hp = hp
        self.mp = mp
        self.speed = speed
        self.attack = attack
        self.defense = defense
        self.spAttack = 0
        self.spDefense = 0
        
      
        self.num = 1
        self.species = " "
        self.types = [Constants.MonsterType.Fire]
        self.genderRatio = (1,0)
        self.preEvoSpecies = ""
        self.postEvoSpecies = ""
        self.evoLevel = 0
          // TODO: transform: skills[Int32] -> skills[Skill]
    }
    
    // random monster initializer
    init(name: String, level: Int32)
    {
        // set constant display properties
        self.name = name
        self.level = level
        
        // generate random properties
        self.element = Constants.MonsterType(rawValue: Utilities.randomElement())!
        
        self.growth = Utilities.randomGrowth()
        self.hp = Utilities.randomValue(type: .HP, growth: growth)
        self.mp = Utilities.randomValue(type: .MP, growth: growth)
        self.speed = Utilities.randomValue(type: .Speed, growth: growth)
        self.attack = Utilities.randomValue(type: .Damage, growth: growth)
        self.defense = Utilities.randomValue(type: .Defense, growth: growth)
        
        
        self.spAttack = 0
        self.spDefense = 0
        
        
        self.num = 1
        self.species = " "
        self.types = [Constants.MonsterType.Fire]
        self.genderRatio = (1,0)
        self.preEvoSpecies = ""
        self.postEvoSpecies = ""
        self.evoLevel = 0
    }
    
    // battle functions
    func damage(amount: Int32) { hp -= amount }
    func heal(amount: Int32) { hp += amount }
    func setDead() { isDead = true }
    func revive(hpAmount: Int32) { isDead = false; hp = hpAmount }
    func consume(amount: Int32) { mp -= amount }
    func restore(amount: Int32) { mp += amount }
    
    var description: String {
        get {
            return "name: \(name), level: \(level), growth: \(growth), element: \(element.description), hp: \(hp), mp: \(mp), speed: \(speed), damage: \(damage), defense: \(defense)"
        }
    }
}