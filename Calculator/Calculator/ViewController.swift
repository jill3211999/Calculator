//
//  ViewController.swift
//  Calculator
//
//  Created by Jill on 2016/10/8.
//  Copyright © 2016年 Jill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet private weak var display: UILabel!
    var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay+digit
        }else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }

    private var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicaSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicaSymbol)
        }
        displayValue = brain.result
    }
    
}

