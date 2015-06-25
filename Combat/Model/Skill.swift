//
//  Skill.swift
//  Combat
//
//  Created by Qingwei Lan on 6/25/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import Foundation

class Skill
{
    let name: String
    let type: Constants.SkillType
    let element: Constants.Element
    
    // designated initializer
    init(name: String, type: Constants.SkillType, element: Constants.Element) {
        self.name = name
        self.type = type
        self.element = element
    }
}