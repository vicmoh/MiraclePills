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
    @IBOutlet weak var stateLabel: UILabel!
    
    //create array for the ui picker
    let states = ["Alaska", "Arkansas", "Alabama", "New York", "California", "Hawaii"]
    
    //create label for country
    let countryLabel: UILabel = {
        //dec var
        let label = UILabel()
        label.text = "Country"
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false//VERY IMPORTANT
        //return label
        return label
    }()
    //create constraint for the country label
    func countryLabelConstraint(){
        countryLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 40).isActive = true
        countryLabel.leadingAnchor.constraint(equalTo: stateLabel.leadingAnchor).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: stateLabel.trailingAnchor).isActive = true
    }//end constarint
    
    //textfield for the country
    let countryTextfield: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter the country..."
        //field.layer.borderWidth = 1
        //field.layer.borderColor = UIColor.gray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false//VERY IMPORTANT
        return field
    }()
    //create constraints for the country field
    func countryTextFieldConstraint(){
        countryTextfield.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 5).isActive = true
        countryTextfield.leadingAnchor.constraint(equalTo: countryLabel.leadingAnchor).isActive = true
        countryTextfield.trailingAnchor.constraint(equalTo: countryLabel.trailingAnchor).isActive = true
    }//end constraint
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        //add country label
        view.addSubview(countryLabel)
        countryLabelConstraint()
        //add country field
        view.addSubview(countryTextfield)
        countryTextFieldConstraint()
    }//end func

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }//end func

    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = false
        countryLabel.isHidden = true
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
        countryLabel.isHidden = false
    }//end uipicker

}//end class

