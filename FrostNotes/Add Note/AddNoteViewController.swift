//
//  AddNoteViewController.swift
//  FrostNotes
//
//  Created by K, Senthil Kumar EX1 on 10/04/21.
//

import UIKit
import CoreData


class AddNoteViewController: UIViewController,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var titletxtFld: UITextField!
    @IBOutlet weak var tagtxtFld: UITextField!
    @IBOutlet weak var descriptiontxtVw: UITextView!
    @IBOutlet weak var imgView: UITextField!
    
    var selectedCountry: String?
    var countryList = ["Home", "Personal", "Event", "Media"]

    
    
    // View model object
    var viewModel = AddNoteViewModel()

    
    @IBAction func createAction(_ sender: Any) {
        
        let notesLevel = NotesModel(title: titletxtFld.text, description: descriptiontxtVw.text, tag: tagtxtFld.text)
        
        viewModel.saveInDB(title: notesLevel.title ?? "", Description: notesLevel.description ?? "", tag:notesLevel.tag ?? "" )
        
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func closeAction(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        descriptiontxtVw.layer.borderColor = UIColor.lightGray.cgColor
        descriptiontxtVw.layer.borderWidth = 0.5
        descriptiontxtVw.layer.cornerRadius = 4.0
        descriptiontxtVw.layer.masksToBounds = true
        
        createPickerView()
        dismissPickerView()
        
     
    }
    

    
    func createPickerView() {
           let pickerView = UIPickerView()
           pickerView.delegate = self
        tagtxtFld.inputView = pickerView
    }
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
       let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
        tagtxtFld.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }
    

    //MARK: TextField Delegate
    private func textFieldShouldReturn(textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }

    
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return countryList.count // number of dropdown items
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return countryList[row] // dropdown item
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedCountry = countryList[row] // selected item
        tagtxtFld.text = selectedCountry
    }
   
    func additionalThings() {
        
        // Clear Text Fields
        titletxtFld.text = ""
        tagtxtFld.text = ""
        descriptiontxtVw.text = ""
        
        dismiss(animated: true, completion: nil)
    }
    

}
