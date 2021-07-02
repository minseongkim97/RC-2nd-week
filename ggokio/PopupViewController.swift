//
//  DatePickerViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/30.
//

import UIKit

class PopupViewController: UIViewController {

    //MARK: - Property
    @IBOutlet weak var popupView: UIView! {
        didSet {
//            self.popupView.layer.cornerRadius = 20
        }
    }

    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        dateTextField.text = formatter.string(from: date)
        
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        
        
    }


    //MARK: - Action
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        dateTextField.text = formatter.string(from: sender.date)
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        dateList.append(dateTextField.text!)
        toDoList[dateCount] = []
        undoList[dateCount] = []
        dateCount += 1
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
