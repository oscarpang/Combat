//
//  MonstersViewController.swift
//  Combat
//
//  Created by Qingwei Lan on 7/3/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import UIKit

class MonstersViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    private var monsters = [Monster]()
}

extension MonstersViewController: UITableViewDelegate
{
    
}

extension MonstersViewController: UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("") as! UITableViewCell
        return cell
    }
}