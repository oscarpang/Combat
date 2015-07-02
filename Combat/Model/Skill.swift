//
//  Skill.swift
//  Combat
//
//  Created by Qingwei Lan on 6/25/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import Foundation

// this is a abstract base class
class Skill: Printable
{
    // used for display only
    let name: String
    let type: Constants.SkillType
    let element: Constants.Element
    
    // unique id for skill
    let id: String
    
    // designated initializer
    init(name: String, id: String, type: Constants.SkillType, element: Constants.Element) {
        self.name = name
        self.id = id
        self.type = type
        self.element = element
    }
    
    // action to be taken, returns a function
    // to be implemented by child classes
//    func action() -> (Monster, Monster) {
//        
//    }
    
    // description of skill
    var description: String {
        get {
            return "Skill name: \(name), skill type: \(type.description), element: \(element.description)"
        }
    }
}