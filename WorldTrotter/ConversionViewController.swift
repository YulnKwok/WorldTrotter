//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by 郭钰麟 on 16/2/13.
//  Copyright © 2016年 Yuln. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var fahrenhietValue:Double?
    
    var celsiusValue:Double?{
        if let value = fahrenhietValue{
            return (value - 32) * (5.0/9.0)
        }else{
            return nil
        }
    }
    
    func updateCelsiusLable(){
        if let value = celsiusValue{
            celsiusLabel.text = "\(value)"
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField:UITextField){
        //celsiusLabel.text = textField.text
        if let text = textField.text where !text.isEmpty{      //what is "where"?
            celsiusLabel.text = textField.text
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(sender:AnyObject){
        textField.resignFirstResponder()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
