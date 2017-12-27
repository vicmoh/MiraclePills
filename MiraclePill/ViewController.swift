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
    //textfield for the country
    let countryTextfield: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter the country..."
        field.translatesAutoresizingMaskIntoConstraints = false//VERY IMPORTANT
        return field
    }()
    //create label for zip code
    let zipCodeLabel: UILabel = {
        //dec var
        let label = UILabel()
        label.text = "Zip Code"
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false//VERY IMPORTANT
        //return label
        return label
    }()
    //create text field for zip code
    //textfield for the country
    let zipCodeTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter the zip code..."
        field.translatesAutoresizingMaskIntoConstraints = false//VERY IMPORTANT
        return field
    }()
    
    func putObjectBelowConstraint(bottomObject: UIView, topObject: UIView){
        bottomObject.topAnchor.constraint(equalTo: topObject.bottomAnchor, constant: 5).isActive = true
        bottomObject.leadingAnchor.constraint(equalTo: topObject.leadingAnchor).isActive = true
        bottomObject.trailingAnchor.constraint(equalTo: topObject.trailingAnchor).isActive = true
    }
    
    //create constraints for all the objects
    func setConstraints(){
        //country label
        countryLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 40).isActive = true
        countryLabel.leadingAnchor.constraint(equalTo: stateLabel.leadingAnchor).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: stateLabel.trailingAnchor).isActive = true
        //all the object below the textfield
        putObjectBelowConstraint(bottomObject: countryTextfield, topObject: countryLabel)
        putObjectBelowConstraint(bottomObject: zipCodeLabel, topObject: countryTextfield)
        putObjectBelowConstraint(bottomObject: zipCodeTextField, topObject: zipCodeLabel)
    }//end constraint func
    
    //set the textfield to default
    func defaultSettingFor(textField: UITextField){
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
    }//end func
    
    /***************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        //add country label and field
        view.addSubview(countryLabel)
        view.addSubview(countryTextfield)
        defaultSettingFor(textField: countryTextfield)
        //add zip code label and field
        view.addSubview(zipCodeLabel)
        view.addSubview(zipCodeTextField)
        defaultSettingFor(textField: zipCodeTextField)
        //object setup
        setConstraints()
    }//end func

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }//end func

    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = false
        countryLabel.isHidden = true
        countryTextfield.isHidden = true
        zipCodeLabel.isHidden = true
        zipCodeTextField.isHidden = true
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
        countryTextfield.isHidden = false
        zipCodeLabel.isHidden = false
        zipCodeTextField.isHidden = false
    }//end uipicker

}//end class

