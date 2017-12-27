//
//  ViewController.swift
//  MiraclePill
//
//  Created by Vicky Mohammad on 2017-12-27.
//  Copyright © 2017 Vicky Mohammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //dec object
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var stateButton: UIButton!
    //create array for the ui picker
    let states = ["Alaska", "Arkansas", "Alabama", "New York", "California", "Hawaii"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }//end func

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }//end func

    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = false
    }//end listener
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }//end uipicker
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }//end uipicker
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }//end uipicker
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateButton.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
    }//end uipicker

}//end class

