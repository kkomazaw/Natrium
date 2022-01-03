//
//  OSMViewController.swift
//  Natrium
//
//  Created by Matsui Keiji on 2016/02/14.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import UIKit

class OSMViewController: UIViewController {
    @IBOutlet weak var SerumNatrium: UITextField!
    @IBOutlet weak var BloodSugar: UITextField!
    @IBOutlet weak var BUN: UITextField!
    @IBOutlet weak var ClearButton: UIButton!
    @IBOutlet weak var RUNButton: UIButton!
    @IBOutlet weak var mOSM: UILabel!
    
    override func viewDidLoad() {
        SerumNatrium.becomeFirstResponder()
        super.viewDidLoad()
    }
    
    @IBAction func myActionRUN(){
        self.view.endEditing(true)
        var vSerumNatrium = 0.0
        if Double(SerumNatrium.text!) != nil{
            vSerumNatrium=Double(SerumNatrium.text!)!
        }
        var vBloodSugar = 0.0
        if Double(BloodSugar.text!) != nil{
            vBloodSugar=Double(BloodSugar.text!)!
        }
        var vBUN = 0.0
        if Double(BUN.text!) != nil{
            vBUN=Double(BUN.text!)!
        }
        let vmOSM = 2.0 * vSerumNatrium + vBloodSugar/18.0 + vBUN/2.8
        mOSM.text = "\(Int(round(vmOSM)))"
    }//@IBAction func myActionRUN()
    
    @IBAction func myActionClear(){
        SerumNatrium.text = ""
        BloodSugar.text = ""
        BUN.text = ""
        mOSM.text = ""
        SerumNatrium.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
