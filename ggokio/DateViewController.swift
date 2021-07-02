//
//  ViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/29.
//

import UIKit
import UserNotifications

public var countButtonClicked: Int = 0
public var dateIndex: Int = 0
public var dateCount: Int = 0
public var diaryText = [Int : String]()
public var toDoList = [Int : [ToDoItem]]()
public var undoList = [Int : [String]]()
public var feeling = [Int : String]()
public var dateList = [String]()


class DateViewController: UIViewController {

    //MARK: - Property
   

    @IBOutlet weak var datePlusButton: UIButton! {
        didSet {
//            self.datePlusButton.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak var dateTableView: UITableView! {
        didSet {
            self.dateTableView.dataSource = self
            self.dateTableView.delegate = self
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("datevc will appear")
        dateTableView.reloadData()
    }

    //MARK: - Function

    
    //MARK: - Action
    @IBAction func datePlusButtonPressed(_ sender: UIButton) {
        
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as? PopupViewController else { return }
        popupVC.modalPresentationStyle = .fullScreen
        present(popupVC, animated: false)
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
        cell.textLabel?.text = dateList[indexPath.section]
        return cell
        
    }
}

extension DateViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dateTableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectVC = storyboard?.instantiateViewController(withIdentifier: "SelectViewController") as? SelectViewController else { return }
        selectVC.modalPresentationStyle = .fullScreen
        
        dateIndex = indexPath[0]
        present(selectVC, animated: true)
    }
}

