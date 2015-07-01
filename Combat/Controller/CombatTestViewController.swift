//
//  CombatTestViewController.swift
//  Combat
//
//  Created by Qingwei Lan on 7/1/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import UIKit

class CombatTestViewController: UIViewController
{
    // UI elements
    // Monster 1
    @IBOutlet weak var m1NameLabel: UILabel!
    @IBOutlet weak var m1HPLabel: UILabel!
    @IBOutlet weak var m1MPLabel: UILabel!
    @IBOutlet weak var m1SpeedLabel: UILabel!
    @IBOutlet weak var m1DamageLabel: UILabel!
    @IBOutlet weak var m1DefenseLabel: UILabel!
    @IBOutlet weak var m1GrowthLabel: UILabel!
    @IBOutlet weak var m1ElementLabel: UILabel!
    
    // Monster 2
    @IBOutlet weak var m2NameLabel: UILabel!
    @IBOutlet weak var m2HPLabel: UILabel!
    @IBOutlet weak var m2MPLabel: UILabel!
    @IBOutlet weak var m2SpeedLabel: UILabel!
    @IBOutlet weak var m2DamageLabel: UILabel!
    @IBOutlet weak var m2DefenseLabel: UILabel!
    @IBOutlet weak var m2GrowthLabel: UILabel!
    @IBOutlet weak var m2ElementLabel: UILabel!
    
    // outcome log for battle
    @IBOutlet weak var logText: UITextView!
    
    // Combat instance initialization
    let combat = Combat(monster1: Monster(name: "Monster 1", level: 0), monster2: Monster(name: "Monster 2", level: 0))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // set up constant display properties
        m1NameLabel.text = "Name:  \(combat.monster1.name)"
        m2NameLabel.text = "Name:  \(combat.monster2.name)"
        m1GrowthLabel.text = "Growth:  \(combat.monster1.growth)"
        m2GrowthLabel.text = "Growth:  \(combat.monster2.growth)"
        m1ElementLabel.text = "Element:  \(combat.monster1.element.description)"
        m2ElementLabel.text = "Element:  \(combat.monster2.element.description)"
        
        updateUserInterface()
    }
    
    // battle methods
    var m1Chosen: Bool = false {
        didSet{
            if m1Chosen && m2Chosen {
                evaluate()
            }
        }
    }
    var m2Chosen: Bool = false {
        didSet{
            if m1Chosen && m2Chosen {
                evaluate()
            }
        }
    }
    
    @IBAction func m1Attack() { combat.attack(attacker: combat.monster1); m1Chosen = true }
    @IBAction func m1Defend() { combat.defend(defender: combat.monster1); m1Chosen = true }
    @IBAction func m1Escape() { combat.escape(escaper: combat.monster1); m1Chosen = true }
    @IBAction func m2Attack() { combat.attack(attacker: combat.monster2); m2Chosen = true }
    @IBAction func m2Defend() { combat.defend(defender: combat.monster2); m2Chosen = true }
    @IBAction func m2Escape() { combat.escape(escaper: combat.monster2); m2Chosen = true }
    
    // evaluate and update UI
    func evaluate()
    {
        let result = combat.evaluate()
        logText.text = result + logText.text
        
        updateUserInterface()
        
        m1Chosen = false
        m2Chosen = false
    }
    
    // updates display
    func updateUserInterface()
    {
        m1HPLabel.text = "HP:  \(combat.monster1.hp)"
        m2HPLabel.text = "HP:  \(combat.monster2.hp)"
        m1MPLabel.text = "MP:  \(combat.monster1.mp)"
        m2MPLabel.text = "MP:  \(combat.monster2.mp)"
        m1SpeedLabel.text = "Speed:  \(combat.monster1.speed)"
        m2SpeedLabel.text = "Speed:  \(combat.monster2.speed)"
        m1DamageLabel.text = "Damage:  \(combat.monster1.damage)"
        m2DamageLabel.text = "Damage:  \(combat.monster2.damage)"
        m1DefenseLabel.text = "Defense:  \(combat.monster1.defense)"
        m2DefenseLabel.text = "Defense:  \(combat.monster2.defense)"
    }
    
}
