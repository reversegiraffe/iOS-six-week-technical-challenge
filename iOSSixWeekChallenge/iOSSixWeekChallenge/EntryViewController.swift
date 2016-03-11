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
    
    static let sharedController = EntryViewController()
    

    @IBOutlet weak var entryTextView: UITextView!

    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func enterButtonTapped(sender: AnyObject) {
        
        let entryArray = createArray(entryTextView.text)
        
        if entryArray.count % 2 != 0 || entryArray.count == 0 {
            
            let alertController = UIAlertController(title: "Invalid Entry", message: "Please enter an even number of elements", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alertController.addAction(okAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            
            let result = "\(pairArray(entryArray))"
            resultsLabel.text = result
        }
    }
    
    func pairArray(array: [String]) -> [(String, String)]  {
        
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
    
    func createArray(string: String) -> [String] {
        
        return string.characters.split { $0 == "," }.map(String.init)
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
