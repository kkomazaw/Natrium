//
//  FENaViewController.swift
//  Natrium
//
//  Created by Matsui Keiji on 2016/02/14.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import UIKit

class FENaViewController: UIViewController {
    @IBOutlet var UrineNatrium: UITextField!
    @IBOutlet var SerumNatrium: UITextField!
    @IBOutlet var UrineUN: UITextField!
    @IBOutlet var BUN: UITextField!
    @IBOutlet var UrineCreatinine: UITextField!
    @IBOutlet var SerumCreatinine: UITextField!
    @IBOutlet var DecimalButton: UIButton!
    @IBOutlet var ClearButton: UIButton!
    @IBOutlet var RUNButton: UIButton!
    @IBOutlet var FENa: UILabel!
    @IBOutlet var FEUN: UILabel!
    
    override func viewDidLoad() {
        UrineNatrium.becomeFirstResponder()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func myActionRUN(){
        self.view.endEditing(true)
        var vUrineNatrium=0.0
        if Double(UrineNatrium.text!) != nil{
            vUrineNatrium=Double(UrineNatrium.text!)!
        }
        var vSerumNatrium=0.0
        if Double(SerumNatrium.text!) != nil{
            vSerumNatrium=Double(SerumNatrium.text!)!
        }
        var vUrineUN=0.0
        if Double(UrineUN.text!) != nil{
            vUrineUN=Double(UrineUN.text!)!
        }
        var vBUN=0.0
        if Double(BUN.text!) != nil{
            vBUN=Double(BUN.text!)!
        }
        var vUrineCreatinine=0.0
        if Double(UrineCreatinine.text!) != nil{
            vUrineCreatinine=Double(UrineCreatinine.text!)!
        }
        var vSerumCreatinine=0.0
        if Double(SerumCreatinine.text!) != nil{
            vSerumCreatinine=Double(SerumCreatinine.text!)!
        }
        if vUrineNatrium>0 && vSerumNatrium>0 && vUrineCreatinine>0 && vSerumCreatinine>0 {
            let vFENa = (vUrineNatrium/vSerumNatrium)/(vUrineCreatinine/vSerumCreatinine)*100.0
            FENa.text = "\(round(vFENa*100.0)/100)"
        }
        else{
            FENa.text="---"
        }
        if vUrineUN>0 && vBUN>0 && vUrineCreatinine>0 && vSerumCreatinine>0 {
            let vFEUN = (vUrineUN/vBUN)/(vUrineCreatinine/vSerumCreatinine)*100.0
            FEUN.text = "\(round(vFEUN*10)/10)"
        }
        else{
            FEUN.text="---"
        }
    }//@IBAction func myActionRUN()
    
    @IBAction func myActionClear(){
        UrineNatrium.text=""
        SerumNatrium.text=""
        UrineUN.text=""
        BUN.text=""
        UrineCreatinine.text=""
        SerumCreatinine.text=""
        FENa.text="---"
        FEUN.text="---"
        UrineNatrium.becomeFirstResponder()
    }
    
    @IBAction func myActionDecimal(){
        if UrineNatrium.isEditing{
            if Double(UrineNatrium.text!) == nil{
                UrineNatrium.text = "0."
            }
            if UrineNatrium.text!.range(of: ".") == nil{
                UrineNatrium.text = UrineNatrium.text! + "."
            }
        }//if UrineNatrium.editing
        if SerumNatrium.isEditing{
            if Double(SerumNatrium.text!) == nil{
                SerumNatrium.text = "0."
            }
            if SerumNatrium.text!.range(of: ".") == nil{
                SerumNatrium.text = SerumNatrium.text! + "."
            }
        }//if SerumNatrium.editing
        if UrineUN.isEditing{
            if Double(UrineUN.text!) == nil{
                UrineUN.text = "0."
            }
            if UrineUN.text!.range(of: ".") == nil{
                UrineUN.text = UrineUN.text! + "."
            }
        }//if UrineUN.editing
        if BUN.isEditing{
            if Double(BUN.text!) == nil{
                BUN.text = "0."
            }
            if BUN.text!.range(of: ".") == nil{
                BUN.text = BUN.text! + "."
            }
        }//if BUN.editing
        if UrineCreatinine.isEditing{
            if Double(UrineCreatinine.text!) == nil{
                UrineCreatinine.text = "0."
            }
            if UrineCreatinine.text!.range(of: ".") == nil{
                UrineCreatinine.text = UrineCreatinine.text! + "."
            }
        }//if UrineCreatinine.editing
        if SerumCreatinine.isEditing{
            if Double(SerumCreatinine.text!) == nil{
                SerumCreatinine.text = "0."
            }
            if SerumCreatinine.text!.range(of: ".") == nil{
                SerumCreatinine.text = SerumCreatinine.text! + "."
            }
        }//if SerumCreatinine.editing
    }//@IBAction func myActionDecimal()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
