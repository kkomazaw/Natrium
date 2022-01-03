//
//  ViewController.swift
//  Natrium
//
//  Created by Matsui Keiji on 2016/02/14.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var NormalSaline: UITextField!
    @IBOutlet var ExtraCellularFluid: UITextField!
    @IBOutlet var StartFluid: UITextField!
    @IBOutlet var MeintenanceFluid: UITextField!
    @IBOutlet var TenPercent: UITextField!
    @IBOutlet var ClearButton: UIButton!
    @IBOutlet var RUN: UIButton!
    @IBOutlet var TotalFluid: UILabel!
    @IBOutlet var NatriumMeq: UILabel!
    @IBOutlet var NaClContents: UILabel!
    
    
    override func viewDidLoad() {
        NormalSaline.becomeFirstResponder()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func myActionRUN(){
        self.view.endEditing(true)
        var vNormalSaline = 0
        if (Int(NormalSaline.text!) != nil){
            vNormalSaline=Int(NormalSaline.text!)!
        }
        var vExtraCellularFluid = 0
        if (Int(ExtraCellularFluid.text!) != nil){
            vExtraCellularFluid=Int(ExtraCellularFluid.text!)!
        }
        var vStartFluid = 0
        if (Int(StartFluid.text!) != nil){
            vStartFluid=Int(StartFluid.text!)!
        }
        var vMeintenanceFluid = 0
        if (Int(MeintenanceFluid.text!) != nil){
            vMeintenanceFluid=Int(MeintenanceFluid.text!)!
        }
        var vTenPercent = 0
        if (Int(TenPercent.text!) != nil){
            vTenPercent = Int(TenPercent.text!)!
        }
        let vTotalFluid = vNormalSaline+vExtraCellularFluid+vStartFluid+vMeintenanceFluid+vTenPercent
        let mEqNormalSaline = Double(vNormalSaline)/1000.0*153.0
        let mEqExtraCellularFluid = Double(vExtraCellularFluid)/1000.0*130.0
        let mEqStartFluid = Double(vStartFluid)/1000.0*90.0
        let mEqMeintenanceFluid = Double(vMeintenanceFluid)/1000.0*35.0
        let mEqTenPercent = Double(vTenPercent)/1000.0*1700.0
        let vNatriumMeq = mEqNormalSaline+mEqExtraCellularFluid+mEqStartFluid+mEqMeintenanceFluid+mEqTenPercent
        let vNaClContents = vNatriumMeq/17.0
        TotalFluid.text = "\(vTotalFluid)"
        NatriumMeq.text = "\(round(vNatriumMeq*10)/10)"
        if round(vNatriumMeq*10)/10 < 1.0{
            NatriumMeq.text = "\(round(vNatriumMeq*100)/100)"
        }
        if round(vNatriumMeq*10)/10 >= 100.0{
            NatriumMeq.text = "\(Int(round(vNatriumMeq)))"
        }
        NaClContents.text = "\(round(vNaClContents*10)/10)"
        if round(vNaClContents*10)/10 < 1.0{
            NaClContents.text = "\(round(vNaClContents*100)/100)"
        }
    }
    
    @IBAction func myActionClear(){
        NormalSaline.text = ""
        ExtraCellularFluid.text = ""
        StartFluid.text = ""
        MeintenanceFluid.text = ""
        TenPercent.text = ""
        TotalFluid.text = ""
        NatriumMeq.text = ""
        NaClContents.text = ""
        NormalSaline.becomeFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}