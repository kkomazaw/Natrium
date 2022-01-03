//
//  DetailNatrium.swift
//  Natrium
//
//  Created by Matsui Keiji on 2016/02/15.
//  Copyright © 2016年 Matsui Keiji. All rights reserved.
//

import UIKit
import WatchKit

class DetailNatrium: WKInterfaceController {
    var vNormalSaline = 0
    var vExtraCellularFluid = 0
    var vStartFluid = 0
    var vMaintenanceFluid = 0
    var vTenpercent = 0
    @IBOutlet weak var NormalSalinePicker: WKInterfacePicker!
    @IBOutlet weak var ExtraCellularFluidPicker: WKInterfacePicker!
    @IBOutlet weak var StartFluidPicker: WKInterfacePicker!
    @IBOutlet weak var MaintenanceFluidPicker: WKInterfacePicker!
    @IBOutlet weak var TenpercentPicker: WKInterfacePicker!
    @IBOutlet weak var TotalVolume: WKInterfaceLabel!
    @IBOutlet weak var NatriumMeq: WKInterfaceLabel!
    @IBOutlet weak var NaClContents: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        var pickerItems: [WKPickerItem] = []
        for i in 0...100 {
            let item = WKPickerItem()
            item.title = "\(i*100)"
            pickerItems.append(item)
        }
        self.NormalSalinePicker.setItems(pickerItems)
        self.ExtraCellularFluidPicker.setItems(pickerItems)
        self.StartFluidPicker.setItems(pickerItems)
        self.MaintenanceFluidPicker.setItems(pickerItems)
        var tenpercentPickerItems: [WKPickerItem] = []
        for i in 0...100{
            let item = WKPickerItem()
            item.title = "\(i*10)"
            tenpercentPickerItems.append(item)
        }
        self.TenpercentPicker.setItems(tenpercentPickerItems)
        // Configure interface objects here.
    }//override func awakeWithContext(context: AnyObject?)
    
    func myCalc(){
        let mEqNormalSaline = Double(vNormalSaline)/1000.0*153.0
        let mEqExtraCellularFluid = Double(vExtraCellularFluid)/1000.0*130.0
        let mEqStartFluid = Double(vStartFluid)/1000.0*90.0
        let mEqMaintenanceFluid = Double(vMaintenanceFluid)/1000.0*35.0
        let mEqTenpercent = Double(vTenpercent)/1000.0*1700.0
        let vTotalVolume = vNormalSaline + vExtraCellularFluid + vStartFluid + vMaintenanceFluid + vTenpercent
        let vNatriumMeq = mEqNormalSaline + mEqExtraCellularFluid + mEqStartFluid + mEqMaintenanceFluid + mEqTenpercent
        let vNaClContents = vNatriumMeq/17.0
        TotalVolume.setText("Volume " + "\(vTotalVolume)" + "ml")
        NatriumMeq.setText("sodium " + "\(Int(round(vNatriumMeq)))" + "mEq")
        NaClContents.setText("equivalent" + "\(round(vNaClContents*10.0)/10)" + "g salt")
    }
    
    @IBAction func NormalSalinePickerChanged(_ value: Int){
        vNormalSaline = value*100
        self.myCalc()
    }
    
    @IBAction func ExtraCellularFluidPickerChanged(_ value: Int){
        vExtraCellularFluid = value*100
        self.myCalc()
    }
    
    @IBAction func StartFluidPickerChanged(_ value: Int){
        vStartFluid = value*100
        self.myCalc()
    }
    
    @IBAction func MaintenanceFluidPickerChanged(_ value: Int){
        vMaintenanceFluid = value*100
        self.myCalc()
    }
    
    @IBAction func TenpercentPickerChanged(_ value: Int){
        vTenpercent = value*10
        self.myCalc()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}//class DetailNatrium: WKInterfaceController
