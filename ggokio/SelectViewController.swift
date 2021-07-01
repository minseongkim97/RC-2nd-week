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
        
        let toDoAlert = UIAlertController(title: "남아있는 일", message: "\(undoList[dateIndex]!)", preferredStyle: .alert)
        toDoAlert.addAction(UIAlertAction(title: "확인", style: .default))

        switch feeling[dateIndex] {
        case "happy":
            toDoAlert.message = """
\(undoList[dateIndex]!)
오늘의 기분 : 행복
"""
            present(toDoAlert, animated: true)
        case "angry":
            toDoAlert.message = """
\(undoList[dateIndex]!)
오늘의 기분 : 짜증
"""
            present(toDoAlert, animated: true)
        case "sad":
            toDoAlert.message = """
\(undoList[dateIndex]!)
오늘의 기분 : 슬픔
"""
            present(toDoAlert, animated: true)
        case "soso":
            toDoAlert.message = """
\(undoList[dateIndex]!)
오늘의 기분 : 쏘쏘
"""
            present(toDoAlert, animated: true)
        default:
            print("선택x")
            present(toDoAlert, animated: true)
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
