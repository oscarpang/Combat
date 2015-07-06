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
    enum MonsterType: Int32, Printable {
        case Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground, Flying, Psychic, Bug, Rock, Ghost, Gragon, Dark, Steel, Fairy
        
        var description: String {
            switch self {
            case .Normal: return "Normal"
            case .Fire: return "Fire"
            case .Water: return "Water"
            case .Electric: return "Electric"
            case .Grass: return "Grass"
            case .Ice: return "Ice"
            case .Fighting: return "Fighting"
            case .Poison: return "Poison"
            case .Ground: return "Ground"
            case .Flying: return "Flying"
            case .Psychic: return "Psychic"
            case .Bug: return "Bug"
            case .Rock: return "Rock"
            case .Ghost: return "Ghost"
            case .Gragon: return "Gragon"
            case .Dark: return "Dark"
            case .Steel: return "Steel"
            case .Fairy: return "Fairy"                
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