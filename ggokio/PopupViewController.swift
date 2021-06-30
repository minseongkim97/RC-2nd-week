//
//  DatePickerViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/30.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        dateTextField.text = formatter.string(from: date)
        
        let datePicker = UIDatePicker()
       
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 250)
        dateTextField.inputView = datePicker
    }

    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        dateTextField.text = formatter.string(from: sender.date)
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)

    }
}
