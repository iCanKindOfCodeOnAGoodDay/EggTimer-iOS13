//
//  ViewController.swift
//  EggTimer
//
//  Created by Scott Quashen on 02/23/2024.
//

import UIKit

class ViewController: UIViewController {
    
    
        
    
//  Variable Declrations section -----------------------------
    
    let eggDict = ["Soft": 5, "Medium": 7, "Hard": 9]
    
    var timer = Timer()
    
    
//  Function Definitions section -----------------------------
    
    func startTimer(secs: Int) {
        
        """
        
        Description
        ------------
        The startTimer() function is a countdown that updates the UILabel, timerLabel, and the progress bar. Notice each int in the division to calculate the progress is converted to a Float individually. If the entire value is converted after division instead, the result will always be 0.0 and the progress will not work.
        Parameters
        ------------
        secs :
            Int
            Create a local variable based on the Dict value passed in from the egg button
        Returns
        ------------
        none
        
        """
        
        timer.invalidate()
        let totalTime = secs
        var secondsPassed = 0
        var progress: Float = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            if secondsPassed < totalTime {
                progress = Float(secondsPassed) / Float(totalTime)
                progreessBar.progress = progress
                self.timerLabel.text = String((totalTime - secondsPassed))
                secondsPassed += 1
            } else {
                self.timerLabel.text = "done"
                progreessBar.progress = 1.0
                Timer.invalidate()
            }
        }
    }
    
// end of startTimer() function
    
    
   
    
//  User Interface section -----------------------------
    
    @IBAction func eggButton(_ sender: UIButton) {
        
        """
        
        Description
        ------------
        Press the eggButton() to extract the dict key from that button, and call start timer
        Parameters
        ------------
        secs :
            Int
            Passing in the unwrapped optional from the egg dict into the timer func
        Returns
        ------------
        none
        
        """
        
        var value = sender.titleLabel!.text!
        startTimer(secs: eggDict[value]!)
     
    }

// end of egg  button UI Element

    @IBOutlet weak var timerLabel: UILabel!
    
    
    @IBOutlet weak var progreessBar: UIProgressView!
    
  
}
// End of view controller class

