//
//  ToDoViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/29.
//

import UIKit

class ToDoViewController: UIViewController {

    //MARK: - Property
    @IBOutlet weak var toDoTableView: UITableView! {
        didSet {
            self.toDoTableView.dataSource = self
            self.toDoTableView.delegate = self
        }
    }
    
    var todoList = [String]()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(toDoList[dateIndex]!)
  
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
                    
                    toDoList[dateIndex]!.append(text)
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
        cell.textLabel?.text = toDoList[dateIndex]![indexPath.row]
        return cell
    }
}

extension ToDoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDoTableView.deselectRow(at: indexPath, animated: true)
        
    }
}
