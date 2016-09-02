//
//  GameLibraryViewController.swift
//  Critchlore
//
//  Created by Rachel on 8/20/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class GameLibraryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var libraryCollectionView: UICollectionView!
    private var games: [String] = [GameNames.monsterPoetry]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign up for classes"

    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if (collectionView == self.libraryCollectionView) {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("gameCell", forIndexPath: indexPath) as! GameCell
            cell.titleLabel.text = self.games[indexPath.row]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    // MARK: UICollectionViewDelegate

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if (collectionView == self.libraryCollectionView) {
            let gameTypeSelected = self.games[indexPath.row]
            if (gameTypeSelected == GameNames.monsterPoetry) {
                self.performSegueWithIdentifier(SegueNames.monsterPoetry, sender: self)
            }
        }
    }

}
