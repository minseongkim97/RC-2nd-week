//
//  ToDoViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/29.
//

import UIKit

public struct ToDoItem {
    var title: String = ""
    var isChecked: Bool = false
}

class ToDoViewController: UIViewController {

    //MARK: - Property
    @IBOutlet weak var toDoTableView: UITableView! {
        didSet {
            self.toDoTableView.dataSource = self
            self.toDoTableView.delegate = self
        }
    }
    @IBOutlet weak var plusButton: UIButton! {
        didSet {
            self.plusButton.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var finishButton: UIButton! {
        didSet {
            self.finishButton.layer.cornerRadius = 15
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        undoList[dateIndex] = []
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if countButtonClicked % 5 == 0 && countButtonClicked != 0{
            guard let adVC = storyboard?.instantiateViewController(withIdentifier: "AdViewController") as? AdViewController else { return }
            adVC.modalPresentationStyle = .fullScreen
            
            present(adVC, animated: false)
            countButtonClicked = 0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        for toDoItem in toDoList[dateIndex]! {
            if toDoItem.isChecked == false {
                undoList[dateIndex]!.append(toDoItem.title)
            }
        }
        
        print(undoList)
    }
    
    //MARK: - Action
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "해야할 일", message: "해야할 일을 추가해주세요", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "해야할 일 입력"
        }
        alert.addAction(UIAlertAction(title: "취소", style: .default))
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { _ in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    var toDoItem = ToDoItem()
                    toDoItem.title = text
                    toDoList[dateIndex]!.append(toDoItem)
                    DispatchQueue.main.async {
                        self.toDoTableView.reloadData()
                    }
                }
            }
        }))
         
        present(alert, animated: true)
    }
    
    
    @IBAction func todoFinishButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
}


//MARK: - Extension
extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        toDoList[dateIndex]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath)
        cell.textLabel?.text = toDoList[dateIndex]![indexPath.row].title
        if toDoList[dateIndex]![indexPath.row].isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

extension ToDoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDoTableView.deselectRow(at: indexPath, animated: true)
        
        DispatchQueue.main.async {
            if toDoList[dateIndex]![indexPath.row].isChecked {
                toDoList[dateIndex]![indexPath.row].isChecked = false
            } else {
                toDoList[dateIndex]![indexPath.row].isChecked = true
            }
            self.toDoTableView.reloadData()
        }
    }
}
