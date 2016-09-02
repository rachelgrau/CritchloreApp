//
//  MonsterPoetryViewController.swift
//  Critchlore
//
//  Created by Rachel on 7/16/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class MonsterPoetryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var extraWordsCollectionView: UICollectionView!
    @IBOutlet var poemCollectionView: UICollectionView!
    private let reuseIdentifier = "wordCell"
    private let cellHeight: CGFloat = 25
    private var words: [String] = ["hello", "random", "computer", "Philz", "coffee", "food", "beach", "dog", "forest", "table", "cup", "spoon", "laptop", "lunch", "breakfast", "dinner", "sugar", "snack", "sun", "summer", "spring", "autumn", "fall"]
    private var extraWords: [String] = ["the", "and", "but", "or", "a", "an"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.poemCollectionView.backgroundColor = UIColor.clearColor()
        self.extraWordsCollectionView.backgroundColor = UIColor.clearColor()
        
        /* Get rid of top margin on poemCollectionView */
        self.automaticallyAdjustsScrollViewInsets = false
        
        /* Shuffle words */
        self.words = Utility.shuffle(self.words)
        
        /* Set up long press gesture recognizer */
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "handleLongGesture:")
        self.poemCollectionView.addGestureRecognizer(longPressGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Dragging gesture callback. */
    func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch(gesture.state) {
            case UIGestureRecognizerState.Began:
                guard let selectedIndexPath = self.poemCollectionView.indexPathForItemAtPoint(gesture.locationInView(self.poemCollectionView)) else {
                    break
                }
                poemCollectionView.beginInteractiveMovementForItemAtIndexPath(selectedIndexPath)
            case UIGestureRecognizerState.Changed:
                poemCollectionView.updateInteractiveMovementTargetPosition(gesture.locationInView(gesture.view!))
            case UIGestureRecognizerState.Ended:
                poemCollectionView.endInteractiveMovement()
            default:
                poemCollectionView.cancelInteractiveMovement()
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if (collectionView == self.poemCollectionView) {
            return 1
        } else if (collectionView == self.extraWordsCollectionView) {
            return 1
        } else {
            return 0
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.poemCollectionView) {
            return self.words.count
        } else if (collectionView == self.extraWordsCollectionView) {
            return self.extraWords.count
        } else {
            return 0
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if (collectionView == self.poemCollectionView) {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.reuseIdentifier, forIndexPath: indexPath) as! WordCollectionViewCell
            cell.label.text = self.words[indexPath.row]
            cell.layer.borderColor = UIColor.blackColor().CGColor
            cell.layer.borderWidth = 1.0
            return cell
        } else if (collectionView == self.extraWordsCollectionView) {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("extraWordCell", forIndexPath: indexPath) as! WordCollectionViewCell
            cell.layer.borderColor = UIColor.blackColor().CGColor
            cell.layer.borderWidth = 1.0
            cell.label.text = self.extraWords[indexPath.row]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView,
        moveItemAtIndexPath sourceIndexPath: NSIndexPath,
        toIndexPath destinationIndexPath: NSIndexPath) {
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize {
        if (collectionView == self.poemCollectionView) {
            /* Create temp label with the word for this cell, so we can figure out its size */
            let word = self.words[indexPath.row]
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            let cellSize:CGSize = CGSizeMake(50, 15)
            //        let cellSize:CGSize = CGSizeMake(label.frame.width, self.cellHeight)
            return cellSize
        } else if (collectionView == self.extraWordsCollectionView) {
            return CGSizeMake(50, 15)
        } else {
            return CGSizeZero
        }
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if (collectionView == self.extraWordsCollectionView) {
            let word = self.extraWords[indexPath.row]
            self.words.append(word)
            self.poemCollectionView.reloadData()
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toPoem") {
            /* Send the poem to the next VC */
            if let pvc = segue.destinationViewController as? PoemViewController {
                var poem: String = self.words[0]
                for i in 1..<self.words.count-1 {
                    let word = self.words[i]
                    poem += " "
                    poem += word
                }
                pvc.text = poem
            }
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
