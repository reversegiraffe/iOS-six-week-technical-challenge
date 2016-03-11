//
//  EntryViewController.swift
//  iOSSixWeekChallenge
//
//  Created by Kaytee on 3/11/16.
//  Copyright © 2016 Kaytee. All rights reserved.
//

import UIKit
import GameplayKit

class EntryViewController: UIViewController {
    
    let sharedController = EntryViewController()

    @IBOutlet weak var entryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func enterButtonTapped(sender: AnyObject) {
    }
    
    func pairArray(array: [String]) -> [(String, String)]  {
        
        //error handling for odd numbers, display alert requiring and even array?
        
        var mutatingArray = array
        var returnArray: [(String, String)] = []
        
        while mutatingArray.count > 0 {
            let firstIndex = GKRandomSource.sharedRandom().nextIntWithUpperBound(mutatingArray.count)
            
            let firstElement = mutatingArray[firstIndex]
            
            mutatingArray.removeAtIndex(firstIndex)
            
            let secondIndex = GKRandomSource.sharedRandom().nextIntWithUpperBound(mutatingArray.count)
            
            let secondElement = mutatingArray[secondIndex]
            
            mutatingArray.removeAtIndex(secondIndex)
            
            returnArray.append(firstElement, secondElement)
            
        }
        
        return returnArray
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
