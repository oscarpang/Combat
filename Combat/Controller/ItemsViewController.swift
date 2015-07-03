//
//  ItemsViewController.swift
//  Combat
//
//  Created by Qingwei Lan on 7/3/15.
//  Copyright (c) 2015 Qingwei Lan. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var items = [Item]()
}

extension ItemsViewController: UICollectionViewDelegate
{
    
}

extension ItemsViewController: UICollectionViewDataSource
{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("", forIndexPath: indexPath) as! UICollectionViewCell
        return cell
    }
}