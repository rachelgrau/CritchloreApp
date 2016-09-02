//
//  Utility.swift
//  Critchlore
//
//  Created by Rachel on 7/15/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class Utility: NSObject {

    /* Given an array of Strings, returns a new array of the same length
       with all the contents shuffled. */
    static func shuffle(inputArray:Array<String>) -> Array<String> {
        var newArr = Array(inputArray)
        for i in 0..<inputArray.count-1 {
            let j = Int(arc4random_uniform(UInt32(inputArray.count - i))) + i;
            guard i != j else {
                continue
            }
            swap(&newArr[i], &newArr[j])
        }
        return newArr
    }
}
