//
//  DetailFENa.swift
//  Natrium
//
//  Created by Matsui Keiji on 2016/02/15.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import UIKit
import WatchKit

class DetailFENa: WKInterfaceController {
    var vUrineNatrium = 0.0
    var vSerumNatrium = 100.0
    var vUrineCreatinine = 0.0
    var vSerumCreatinine = 0.0
    var vUrineUN = 0.0
    var vBUN = 0.0
    @IBOutlet weak var UrineNatrium: WKInterfacePicker!
    @IBOutlet weak var SerumNatrium: WKInterfacePicker!
    @IBOutlet weak var UrineUN: WKInterfacePicker!
    @IBOutlet weak var BUN: WKInterfacePicker!
    @IBOutlet weak var UrineCreatinine: WKInterfacePicker!
    @IBOutlet weak var SerumCreatinine: WKInterfacePicker!
    @IBOutlet weak var FENaLabel: WKInterfaceLabel!
    @IBOutlet weak var FEUNLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        var urineNatriumPickerItems: [WKPickerItem] = []
        for i in 0...300{
            let item = WKPickerItem()
            item.title = "\(i)"
            urineNatriumPickerItems.append(item)
        }
        self.UrineNatrium.setItems(urineNatriumPickerItems)
        self.UrineUN.setItems(urineNatriumPickerItems)
        var serumNatriumPickerItems: [WKPickerItem] = []
        for i in 0...100{
            let item = WKPickerItem()
            item.title = "\(i+100)"
            serumNatriumPickerItems.append(item)
        }
        self.SerumNatrium.setItems(serumNatriumPickerItems)
        var urineCreatininePickerItems: [WKPickerItem] = []
        for i in 0...200{
            let item = WKPickerItem()
            item.title = "\(i)"
            urineCreatininePickerItems.append(item)
        }
        self.UrineCreatinine.setItems(urineCreatininePickerItems)
        self.BUN.setItems(urineCreatininePickerItems)
        var serumCreatininePickerItems: [WKPickerItem] = []
        for i in 0...200{
            let item = WKPickerItem()
            item.title = "\(Double(i)/10.0)"
            serumCreatininePickerItems.append(item)
        }
        self.SerumCreatinine.setItems(serumCreatininePickerItems)
    }//override func awakeWithContext(context: AnyObject?)
    
    func myCalc(){
        if vUrineNatrium > 0 && vUrineCreatinine > 0 && vSerumCreatinine > 0{
            let vFENa = (vUrineNatrium/vSerumNatrium)/(vUrineCreatinine/vSerumCreatinine)*100.0
            if vFENa < 1.0{
                FENaLabel.setText("FENa " + "\(round(vFENa*100.0)/100)" + "% pre renal")
            }
            if vFENa >= 1.0 && vFENa < 10.0{
                FENaLabel.setText("FENa " + "\(round(vFENa*100.0)/100)" + "%")
            }
            if vFENa >= 10.0{
                FENaLabel.setText("FENa " + "\(round(vFENa*10.0)/10)" + "%")
            }
        }
        else{
            FENaLabel.setText("FENa ---")
        }
        if vUrineUN>0 && vBUN>0 && vUrineCreatinine>0 && vSerumCreatinine>0 {
            let vFEUN = (vUrineUN/vBUN)/(vUrineCreatinine/vSerumCreatinine)*100.0
            if vFEUN < 10.0{
                FEUNLabel.setText("FEUN " + "\(round(vFEUN*100)/100)" + "% pre renal")
            }
            if vFEUN >= 10.0 && vFEUN < 35.0{
                FEUNLabel.setText("FEUN " + "\(round(vFEUN*10)/10)" + "% pre renal")
            }
            if vFEUN >= 35.0{
                FEUNLabel.setText("FEUN " + "\(round(vFEUN*10)/10)" + "%")
            }
        }
        else{
            FEUNLabel.setText("FEUN ---")
        }
    }//func myCalc()
    
    @IBAction func UrineNatriumChanged(_ value: Int){
        vUrineNatrium = Double(value)
        self.myCalc()
    }
    
    @IBAction func SerumNatriumChanged(_ value: Int){
        vSerumNatrium = Double(value+100)
        self.myCalc()
    }
    
    @IBAction func UrineUNChanged(_ value: Int){
        vUrineUN = Double(value)
        self.myCalc()
    }
    
    @IBAction func BUNChanged(_ value: Int){
        vBUN = Double(value)
        self.myCalc()
    }
    
    @IBAction func UrineCreatinineChanged(_ value: Int){
        vUrineCreatinine = Double(value)
        self.myCalc()
    }
    
    @IBAction func SerumCreatinineChanged(_ value: Int){
        vSerumCreatinine = Double(value)/10.0
        self.myCalc()
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
