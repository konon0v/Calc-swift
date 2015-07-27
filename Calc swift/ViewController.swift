//
//  ViewController.swift
//  Calc swift
//
//  Created by Roman Kononov on 08.06.15.
//  Copyright (c) 2015 Roman Kononov. All rights reserved.
//

import UIKit

var x:Double = 0
var y:Double = 0

var enterFlag = 1
var yFlag = 1

var decPoint = 0
var power = 1
var operationAcive = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digits(sender: UIButton)
    {
        if enterFlag == 1
        {
            x=0
            enterFlag=0
        }
        if decPoint == 0
        {
          x = x*10 + Double(sender.tag)
            switch String(x)
            {
            case let z where z.hasSuffix(".0"):
                self.result.text = " " + String(Int(x))
                default: self.result.text = " " + String(x)
            }
            
        }
        else
        {
        x = x + Double(sender.tag)/pow(10, Double(power))
        power++
        }
        
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
        default: self.result.text = " " + String(x)
        }
        
    }

    @IBAction func operation(sender: UIButton)
    {
        if enterFlag != 1 && yFlag == 1
        {
            switch operationAcive
            {
            case 1001:
                x=y+x
            case 1002:
                x=y-x
            case 1003:
                x=y*x
            case 1004:
                x=y/x
            default:   self.result.text = " " + String(x)
            }
        }
        operationAcive = sender.tag
        y=x
        yFlag = 1
        enterFlag = 1;
        
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
        default: self.result.text = " " + String(x)
        }
        decPoint = 0
        power = 1
    }
    
    @IBAction func dec(sender: UIButton)
    {
        if decPoint == 0
        {
            decPoint = 1
        }
    }
    
    @IBAction func clear(sender: UIButton)
    {
        
    
        x = 0
        y = 0
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
        default: self.result.text = " " + String(x)
        }
         enterFlag = 1
         yFlag = 1
        
         decPoint = 0
         power = 1
         operationAcive = 0
    }
    
    
    @IBAction func plusminus(sender: AnyObject) {
        x = -x
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
        default: self.result.text = " " + String(x)
        }

    }
    
    @IBAction func percent(sender: AnyObject) {
        x=x/100
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
        default: self.result.text = " " + String(x)
        }

    }
    
    
    @IBOutlet weak var result: UILabel!
}

