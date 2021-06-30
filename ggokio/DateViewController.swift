//
//  ViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/29.
//

import UIKit

public var countButtonClicked: Int = 0
public var diaryText = [Int : String]()
public var feeling = [Int : String]()

class DateViewController: UIViewController {

    //MARK: - Property
    var dateList = [String]()
//    let diaryVC = DiaryViewController()
    
    @IBOutlet weak var datePlusButton: UIButton! {
        didSet {
            self.datePlusButton.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet private weak var dateTableView: UITableView! {
        didSet {
            self.dateTableView.dataSource = self
            self.dateTableView.delegate = self
//            self.dateTableView.register(UINib(nibName: "DateTableViewCell", bundle: nil), forCellReuseIdentifier: "DateTableViewCell")
        }
    }
    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        print(diaryVC.diaryText)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("datevc will appear")
        
        let feelingAlert = UIAlertController(title: "행복", message: "행복", preferredStyle: .alert)
        feelingAlert.addAction(UIAlertAction(title: "확인", style: .default))
        
        switch feeling[sectionIndex] {
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
    
    //MARK: - Function
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDatePicker() {
        
    }
    
    //MARK: - Action
    @IBAction func datePlusButtonPressed(_ sender: UIButton) {
        
        let datePickAlert = UIAlertController(title: "Date", message: "날짜를 선택해주세요", preferredStyle: .alert)
        var textField = UITextField()
        
        datePickAlert.addTextField { field in
            textField = field
            textField.placeholder = "날짜 선택"
        }
        
        
        datePickAlert.addAction(UIAlertAction(title: "취소", style: .default))
        datePickAlert.addAction(UIAlertAction(title: "추가", style: .default, handler: { _ in
        
            if let text = textField.text, !text.isEmpty {
                
                DispatchQueue.main.async {
                    self.dateList.append(text)
                    self.dateTableView.reloadData()
                }
            }
            
        }))
        
        present(datePickAlert, animated: true)
        
    }
}
    
//MARK: - Extension
extension DateViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dateList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dateTableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath)
        cell.textLabel?.text = self.dateList[indexPath.section]
        return cell
        
    }
    
    
}

extension DateViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dateTableView.deselectRow(at: indexPath, animated: true)
        countButtonClicked += 1
        print(countButtonClicked)
        
        guard let diaryVC = storyboard?.instantiateViewController(withIdentifier: "DiaryViewController") as? DiaryViewController else { return }
        diaryVC.modalPresentationStyle = .fullScreen
        
        sectionIndex = indexPath[0]
        
        present(diaryVC, animated: true)
    }
}