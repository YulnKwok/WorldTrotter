//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by 郭钰麟 on 16/2/13.
//  Copyright © 2016年 Yuln. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController,UITextFieldDelegate{
    
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let numberFormatter:NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenhietValue:Double?{
        didSet{
            updateCelsiusLable()
        }
    }
    
    var celsiusValue:Double?{
        if let value = fahrenhietValue{
            return (value - 32) * (5/9)
        }else{
            return nil
        }
    }
    
    func updateCelsiusLable(){
        if let value = celsiusValue{
            //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField:UITextField){
        //celsiusLabel.text = textField.text
//        if let text = textField.text where !text.isEmpty{      //what is "where"?
//            celsiusLabel.text = textField.text
//        }else{
//            celsiusLabel.text = "???"
//        }
        if let text = textField.text,value = Double(text){
            fahrenhietValue = value
        }else{
            fahrenhietValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender:AnyObject){
        textField.resignFirstResponder()
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        print("Current Text:\(textField.text)")
//        print("Replacement Text:\(string)")
//        return true
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }else{
            return true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
