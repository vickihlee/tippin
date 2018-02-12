//
//  ViewController.swift
//  tippy
//
//  Created by Vicki Lee on 1/4/18.
//  Copyright © 2018 Vicki Lee. All rights reserved.
//

import QuartzCore

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillAmt: UITextField!
    @IBOutlet weak var Person: UITextField!
    @IBOutlet weak var TipPercent: UISegmentedControl!
    
    @IBOutlet weak var TipEachBg: UIView!
    @IBOutlet weak var TotalEachBg: UIView!
    
    @IBOutlet weak var TipTotalBg: UIView!
    @IBOutlet weak var TotalTotalBg: UIView!
    
    @IBOutlet weak var TipEach: UILabel!
    @IBOutlet weak var TotalEach: UILabel!
    
    @IBOutlet weak var TipTotal: UILabel!
    @IBOutlet weak var TotalTotal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //  let red = UIColor(red: 232.0/255.0, green: 147.0/255.0, blue: 119.0/255.0, alpha: 1.0)
        
        BillAmt.layer.cornerRadius = 10;
        BillAmt.layer.borderWidth = 0;
 //     BillAmt.layer.borderColor = red.cgColor;
        BillAmt.layer.masksToBounds = true;

        Person.layer.cornerRadius = 10;
        Person.layer.borderWidth = 0;
        Person.layer.masksToBounds = true;
        
        TipEachBg.layer.cornerRadius = 10;
        TipEachBg.layer.borderWidth = 0;
        TipEachBg.layer.masksToBounds = true;
        
        TotalEachBg.layer.cornerRadius = 10;
        TotalEachBg.layer.borderWidth = 0;
        TotalEachBg.layer.masksToBounds = true;
        
        TipTotalBg.layer.cornerRadius = 10;
        TipTotalBg.layer.borderWidth = 0;
        TipTotalBg.layer.masksToBounds = true;
        
        TotalTotalBg.layer.cornerRadius = 10;
        TotalTotalBg.layer.borderWidth = 0;
        TotalTotalBg.layer.masksToBounds = true;
        
        // have keyboard appear automatically and stay there
        self.BillAmt.becomeFirstResponder()
        
        //change keyboard color
        let textFieldAppearance = UITextField.appearance()
        textFieldAppearance.keyboardAppearance = .light //.default//.light//.alert
        
        // add dot in bottom left keyboard
        BillAmt.keyboardType = UIKeyboardType.decimalPad
        
        // make keyboard different color


    }

    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let bill = Double(BillAmt.text!) ?? 0
        
        let TipTotalResult = bill * tipPercentages[TipPercent.selectedSegmentIndex]
        
        // right column = total
        let TotalTotalResult = bill + TipTotalResult
        
        TipTotal.text = String(format: "$%.2f", TipTotalResult)
        TotalTotal.text = String(format: "$%.2f", TotalTotalResult) // TotalTotal.text is where it shows up (on the right column. using the label TotalTotal). TotalTotalResult is using the definition above
        
        // left column = each
        
        let PersonInput = Double(Person.text!) ?? 1
        
        let TipEachResult = (bill * tipPercentages[TipPercent.selectedSegmentIndex]) / PersonInput
        
        let TotalEachResult = (bill + TipTotalResult) / PersonInput
        
        TipEach.text = String(format: "$%.2f", TipEachResult)
        TotalEach.text = String(format: "$%.2f", TotalEachResult)
        // need to use .text cuz cant change format of a Label
        
//      let red = UIColor(red: 232.0/255.0, green: 147.0/255.0, blue: 119.0/255.0, alpha: 1.0)
        
        // Optionally initialize the property to a desired starting value
        TipEachBg.alpha = 0.7
        TotalEachBg.alpha = 0.7
        TipTotalBg.alpha = 0.7
        TotalTotalBg.alpha = 0.7
        UIView.animate(withDuration: 0.5, animations: {
            // This causes first view to fade in and second view to fade out
            self.TipEachBg.alpha = 1
            self.TotalEachBg.alpha = 1
            self.TipTotalBg.alpha = 1
            self.TotalTotalBg.alpha = 1
        })
        // duration= 0 (fast), 1 (slow)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

