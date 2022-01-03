//
//  DetailOSM.swift
//  Natrium
//
//  Created by Matsui Keiji on 2016/02/15.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import UIKit
import WatchKit

class DetailOSM: WKInterfaceController {
    var vNatrium = 100.0
    var vUpperBloodSugar = 0.0
    var vLowerBloodSugar = 0.0
    var vBUN = 0.0
    @IBOutlet weak var NatriumPicker: WKInterfacePicker!
    @IBOutlet weak var BloodSugarUpperPicker: WKInterfacePicker!
    @IBOutlet weak var BloodSugarLowerPicker: WKInterfacePicker!
    @IBOutlet weak var BUNPicker: WKInterfacePicker!
    @IBOutlet weak var OSMLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        var natriumPickerItems: [WKPickerItem] = []
        for i in 100...200{
            let item = WKPickerItem()
            item.title = "\(i)"
            natriumPickerItems.append(item)
        }
        self.NatriumPicker.setItems(natriumPickerItems)
        var bloodSugarUpperPickerItems: [WKPickerItem] = []
        for i in 0...9{
            let item = WKPickerItem()
            item.title = "　" + "\(i)"
        bloodSugarUpperPickerItems.append(item)
        }
        self.BloodSugarUpperPicker.setItems(bloodSugarUpperPickerItems)
        var bloodSugarLowerPickerItems: [WKPickerItem] = []
        for i in 0...99{
            let item = WKPickerItem()
            if i <= 9{
                item.title = "0" + "\(i)"
            }
            else{
                item.title = "\(i)"
            }
        bloodSugarLowerPickerItems.append(item)
        }
        self.BloodSugarLowerPicker.setItems(bloodSugarLowerPickerItems)
        var BUNPickerItems: [WKPickerItem] = []
        for i in 0...200{
            let item = WKPickerItem()
            item.title = "\(i)"
            BUNPickerItems.append(item)
        }
        self.BUNPicker.setItems(BUNPickerItems)
    }//override func awakeWithContext(context: AnyObject?)
    func myCalc(){
        let vOSM = 2.0*vNatrium + (vUpperBloodSugar + vLowerBloodSugar)/18.0 + vBUN/2.8
        OSMLabel.setText("\(Int(round(vOSM)))" + "mOSM")
    }//func myCalc()
    @IBAction func NatriumPickerChanged(_ value: Int){
        vNatrium = Double(value+100)
        self.myCalc()
    }
    @IBAction func BloodSugarUpperPickerChanged(_ value: Int){
        vUpperBloodSugar = Double(value*100)
        self.myCalc()
    }
    @IBAction func BloodSugarLowerPickerChanged(_ value: Int){
        vLowerBloodSugar = Double(value)
        self.myCalc()
    }
    @IBAction func BUNPickerChanged(_ value: Int){
        vBUN = Double(value)
        self.myCalc()
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}//class DetailOSM: WKInterfaceController
