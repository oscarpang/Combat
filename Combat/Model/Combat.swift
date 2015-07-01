//
//  Combat.swift
//  Combat
//
//  Created by Qingwei Lan on 7/1/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import Foundation

class Combat
{
    // two monsters involved in combat
    let monster1: Monster
    let monster2: Monster
    
    // status of game
    // this should be checked before each turn
    // has two values: .Continue or .End
    var status: Constants.GameStatus = .Continue
    
    // initializer for combat
    init(monster1: Monster, monster2: Monster) {
        self.monster1 = monster1
        self.monster2 = monster2
    }
    
    // basic methods for combat
    func attack(#attacker: Monster) { attacker.action = .Attack }
    func defend(#defender: Monster) { defender.action = .Defend }
    func chooseSkill(#skillUser: Monster, skill: Skill) { skillUser.action = .Skill; skillUser.skill = skill }
    func escape(#escaper: Monster) { escaper.action = .Escape }
    
    
    // evaluate the current round of combat
    // sets the status of Combat
    func evaluate() -> String {
        var msg = ""
        if status == .End {
            msg += "Game has already ended!\n\n"
            return msg
        }
        
        msg += "\(monster1.name) takes action: \(monster1.action.description).\n"
        msg += "\(monster2.name) takes action: \(monster2.action.description).\n"
        
        // both monsters attack
        if monster1.action == .Attack && monster2.action == .Attack
        {
            if monster1.speed > monster2.speed {
                status = evaluateAttack(attacker: monster1, target: monster2, bothAttack: true, msg: &msg)
            } else if monster2.speed > monster1.speed {
                status = evaluateAttack(attacker: monster2, target: monster1, bothAttack: true, msg: &msg)
            } else {
                let rand = arc4random() % 2
                if rand == 0 {
                    status = evaluateAttack(attacker: monster1, target: monster2, bothAttack: true, msg: &msg)
                } else {
                    status = evaluateAttack(attacker: monster2, target: monster1, bothAttack: true, msg: &msg)
                }
            }
        }
            
        // one or both monsters escape
        else if monster1.action == .Escape || monster2.action == .Escape
        {
            // both monsters escape
            if monster1.action == .Escape && monster2.action == .Escape
            {
                if monster1.speed > monster2.speed {
                    status = evaluateEscape(escaper: monster1, opponent: monster2, msg: &msg)
                    if status == .Continue {
                        status = evaluateEscape(escaper: monster2, opponent: monster1, msg: &msg)
                    }
                } else if monster2.speed > monster1.speed {
                    status = evaluateEscape(escaper: monster2, opponent: monster1, msg: &msg)
                    if status == .Continue {
                        status = evaluateEscape(escaper: monster1, opponent: monster2, msg: &msg)
                    }
                } else {
                    let rand = arc4random() % 2
                    if rand == 0 {
                        status = evaluateEscape(escaper: monster1, opponent: monster2, msg: &msg)
                        if status == .Continue {
                            status = evaluateEscape(escaper: monster2, opponent: monster1, msg: &msg)
                        }
                    } else {
                        status = evaluateEscape(escaper: monster2, opponent: monster1, msg: &msg)
                        if status == .Continue {
                            status = evaluateEscape(escaper: monster1, opponent: monster2, msg: &msg)
                        }
                    }
                }
            }
                
            // only monster escapes
            else
            {
                // monster1 escapes
                if monster1.action == .Escape
                {
                    // monster2 defends
                    if monster2.action == .Defend
                    {
                        msg += "\(monster2.name) defends.\n"
                        status = evaluateEscape(escaper: monster1, opponent: monster2, msg: &msg)
                    }
                        
                    // monster2 attacks
                    else
                    {
                        let mons1speed = Int32(Float(monster1.speed) * 0.75)
                        if mons1speed >= monster2.speed {
                            status = evaluateEscape(escaper: monster1, opponent: monster2, msg: &msg)
                            if status == .Continue {
                                status = evaluateAttack(attacker: monster2, target: monster1, bothAttack: false, msg: &msg)
                            }
                        } else {
                            status = evaluateAttack(attacker: monster2, target: monster1, bothAttack: false, msg: &msg)
                            if status == .Continue {
                                status = evaluateEscape(escaper: monster1, opponent: monster2, msg: &msg)
                            }
                        }
                    }
                }
                    
                // monster2 escapes
                else
                {
                    // monster1 defends
                    if monster1.action == .Defend
                    {
                        msg += "\(monster1.name) defends.\n"
                        status = evaluateEscape(escaper: monster2, opponent: monster1, msg: &msg)
                    }
                        
                    // monster1 attacks
                    else
                    {
                        let mons2speed = Int32(Float(monster2.speed) * 0.75)
                        if mons2speed >= monster1.speed {
                            status = evaluateEscape(escaper: monster2, opponent: monster1, msg: &msg)
                            if status == .Continue {
                                status = evaluateAttack(attacker: monster1, target: monster2, bothAttack: false, msg: &msg)
                            }
                        } else {
                            status = evaluateAttack(attacker: monster1, target: monster2, bothAttack: false, msg: &msg)
                            if status == .Continue {
                                status = evaluateEscape(escaper: monster2, opponent: monster1, msg: &msg)
                            }
                        }
                    }
                }
            }
        }
            
        // one or both monsters defend
        else
        {
            // both monsters defend
            if monster1.action == .Defend && monster2.action == .Defend
            {
                // nothing happens here
                msg += "Both monsters defend.\n"
                status = .Continue
            }
                
            // monster1 defends
            else if monster1.action == .Defend {
                status = evaluateAttack(attacker: monster2, target: monster1, bothAttack: false, msg: &msg)
            }
                
            // monster2 defends
            else {
                status = evaluateAttack(attacker: monster1, target: monster2, bothAttack: false, msg: &msg)
            }
        }
        
        msg += "\n"
        return msg
    }
    
    // helper function for evaluating attack action
    private func evaluateAttack(#attacker: Monster, target: Monster, bothAttack: Bool, inout msg: String) -> Constants.GameStatus
    {
        if bothAttack
        {
            var damage = attacker.damage - target.defense
            if (damage < 0) { damage = 0 }
            damage += Int32(arc4random() % 10 + 5)
            target.damage(damage)
            
            msg += "\(attacker.name) attacks \(target.name), \(target.name) loses \(damage) hp.\n"
            
            // check if target is dead
            if target.isDead {
                msg += "\(target.name) is dead.\n"
                return .End
            }
            
            damage = target.damage - attacker.defense
            if (damage < 0) { damage = 0 }
            damage += Int32(arc4random() % 10 + 5)
            attacker.damage(damage)
            
            msg += "\(target.name) attacks \(attacker.name), \(attacker.name) loses \(damage) hp.\n"
            
            // check if attacker is dead
            if attacker.isDead {
                msg += "\(attacker.name) is dead.\n"
                return .End
            }
        }
            
        else
        {
            if target.action == .Defend {
                
                var damage = attacker.damage - Int32((Float(target.defense) * 1.5))
                if (damage < 0) { damage = 0 }
                damage += Int32(arc4random() % 10 + 5)
                target.damage(damage)
                
                msg += "\(target.name) defends.\n"
                msg += "\(attacker.name) attacks \(target.name), \(target.name) loses \(damage) hp.\n"

                // check if target is dead
                if target.isDead {
                    msg += "\(target.name) is dead.\n"
                    return .End
                }
                
            } else if target.action == .Escape {
                
                var damage = attacker.damage - target.defense
                if (damage < 0) { damage = 0 }
                damage += Int32(arc4random() % 10 + 5)
                target.damage(damage)
                
                msg += "\(attacker.name) attacks \(target.name), \(target.name) loses \(damage) hp.\n"
                
                // check if target is dead
                if target.isDead {
                    msg += "\(target.name) is dead.\n"
                    return .End
                }
            }
        }
        
        return .Continue
    }
    
    // helper function for evaluating escape action
    private func evaluateEscape(#escaper: Monster, opponent: Monster, inout msg: String) -> Constants.GameStatus
    {
        let totalSpeed = UInt32(Float(escaper.speed + opponent.speed) * 0.75)
        let rand = arc4random() % totalSpeed
        
        if rand >= UInt32(escaper.speed) {
            msg += "\(escaper.name) successfully escapes\n"
            return .End
        } else {
            msg += "\(escaper.name) fails to escape\n"
            return .Continue
        }
    }
}