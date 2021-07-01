//
//  SelectViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/30.
//

import UIKit

class SelectViewController: UIViewController {

    //MARK: - Property
    @IBOutlet weak var dateButton: UIButton! {
        didSet {
            self.dateButton.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var diaryButton: UIButton! {
        didSet {
            self.diaryButton.layer.cornerRadius = 20
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("selectvc will appear")
        
        
        let feelingAlert = UIAlertController(title: "행복", message: "행복", preferredStyle: .alert)
        feelingAlert.addAction(UIAlertAction(title: "확인", style: .default))
        
        switch feeling[dateIndex] {
        case "happy":
            feelingAlert.title = "행복"
            feelingAlert.message = ""
            present(feelingAlert, animated: true)
        case "angry":
            feelingAlert.title = "짜증"
            feelingAlert.message = ""
            present(feelingAlert, animated: true)
        case "sad":
            feelingAlert.title = "슬픔"
            feelingAlert.message = ""
            present(feelingAlert, animated: true)
        case "soso":
            feelingAlert.title = "쏘쏘"
            feelingAlert.message = ""
            present(feelingAlert, animated: true)
        default:
            print("선택x")
        }
    }
    

    //MARK: - Action
    @IBAction func todoButtonPressed(_ sender: UIButton) {
        countButtonClicked += 1
        
        guard let todoVC = storyboard?.instantiateViewController(withIdentifier: "ToDoViewController") as? ToDoViewController else { return }
        todoVC.modalPresentationStyle = .fullScreen
        
        
        present(todoVC, animated: true)
    }
    
    @IBAction func diaryButtonPressed(_ sender: UIButton) {
        
        countButtonClicked += 1
        guard let diaryVC = storyboard?.instantiateViewController(withIdentifier: "DiaryViewController") as? DiaryViewController else { return }
        diaryVC.modalPresentationStyle = .fullScreen
        
        
        present(diaryVC, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
}
