//
//  InterfaceController.swift
//  Rock Paper Scissors WatchKit Extension
//
//  Created by Yezhisai Murugesan on 2/15/15.
//  Copyright (c) 2015 Yezhisai Murugesan. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var computerChoiceImage: WKInterfaceImage!
    
    @IBOutlet weak var choiceLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    @IBOutlet weak var makeAChoiceLabel: WKInterfaceLabel!
   
    var textColor = UIColor.blackColor()
    var options = ["rock.png","paper.png","scissors.png"]
    
    // rock - 0
    // paper - 1
    // scissors - 2
    // rock > scissors
    // paper > rock
    // scissors > paper
    var winningUserChoice = [2,0,1]
    var choice = "Make A Choice"
    var won = "You won!"
    var lost = "You lost!"
    var draw = "It's a draw"
    
    func chooseAWinner(var userChoice:Int) -> String
    {
        var result:String!
        let lbl = choiceLabel
        var randomChoice = Int(arc4random_uniform(3))
        computerChoiceImage.setImageNamed(options[randomChoice])
        
        let label = choiceLabel
        if randomChoice == userChoice
        {
            textColor = UIColor.brownColor()
            lbl.setTextColor(textColor)
            result = draw
        }
        else if(randomChoice == winningUserChoice[userChoice])
        {
            textColor = UIColor.blueColor()
            lbl.setTextColor(textColor)
            result = won
        }
        else
        {
            textColor = UIColor.redColor()
            lbl.setTextColor(textColor)
            result = lost
        }
        return result
    }
    
    @IBAction func rockChosen() {
        var result = chooseAWinner(0)
        choiceLabel.setTextColor(textColor)
        choiceLabel.setText(result)
    }
    
    @IBAction func paperChosen() {

        var result = chooseAWinner(1)
        choiceLabel.setTextColor(textColor)
        choiceLabel.setText(result)
    }
    
    @IBAction func scissorsChosen() {

        var result = chooseAWinner(2)
        choiceLabel.setTextColor(textColor)
        choiceLabel.setText(result)

    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
