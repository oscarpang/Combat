//
//  Constants.swift
//  Combat
//
//  Created by Qingwei Lan on 6/24/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import Foundation

class Constants
{
    enum Element: Int32, Printable {
        case Fire, Water, Earth, Thunder, Wind
        
        var description: String {
            switch self {
            case .Fire: return "Fire"
            case .Water: return "Water"
            case .Earth: return "Earth"
            case .Thunder: return "Thunder"
            case .Wind: return "Wind"
            }
        }
    }
    
    enum SkillType: Int32, Printable {
        case Attack, Defend, Heal, Buff
        
        var description: String {
            switch self {
            case .Attack: return "Attack"
            case .Defend: return "Defend"
            case .Heal: return "Heal"
            case .Buff: return "Buff"
            }
        }
    }
    
    // default action is attack
    enum Action: Printable {
        case Attack, Defend, Skill, Escape
        
        var description: String {
            switch self {
            case .Attack: return "Attack"
            case .Defend: return "Defend"
            case .Skill: return "Use Skill"
            case .Escape: return "Escape"
            }
        }
    }
    
    enum GameStatus: Printable {
        case Continue, End
        
        var description: String {
            switch self {
            case .Continue: return "Continue Game"
            case .End : return "Game Ended"
            }
        }
    }
}