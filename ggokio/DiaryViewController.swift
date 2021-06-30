//
//  DiaryViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/29.
//

import UIKit

public var sectionIndex: Int = 0

class MyButton: UIButton {
    var isChecked: Bool = false
}

class DiaryViewController: UIViewController {

    //MARK: - Property

    @IBOutlet weak var finishButton: UIButton! {
        didSet {
            self.finishButton.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak var roundView: UIView! {
        didSet {
            self.roundView.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet var Buttons: [MyButton]!
    
    @IBOutlet weak var diaryTextView: UITextView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("diaryvc will appear")
        diaryTextView.text = diaryText[sectionIndex]
        
        for btn in Buttons {
            if btn.currentTitle == feeling[sectionIndex] {
                btn.backgroundColor = .systemIndigo
                return
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if countButtonClicked % 3 == 0 && countButtonClicked != 0{
            guard let adVC = storyboard?.instantiateViewController(withIdentifier: "AdViewController") as? AdViewController else { return }
            adVC.modalPresentationStyle = .fullScreen
            
            present(adVC, animated: true)
            countButtonClicked = 0
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("dairyvc did disappear")
        
        
        for btn in Buttons {
            if btn.isChecked {
                switch btn.currentTitle {
                case "happy":
                    feeling[sectionIndex] = "happy"
                case "angry":
                    feeling[sectionIndex] = "angry"
                case "sad":
                    feeling[sectionIndex] = "sad"
                case "soso":
                    feeling[sectionIndex] = "soso"
                default:
                    print("선택x")
                }
                return
            }
        }

    }

    //MARK: - Action
    @IBAction func feelingButtonPressed(_ sender: UIButton) {
        for btn in Buttons {
            if btn == sender {
                btn.backgroundColor = .systemIndigo
                btn.isChecked = true
            } else {
                btn.backgroundColor = .systemGroupedBackground
                btn.isChecked = false
            }
        }
    }
    
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        guard let dText = diaryTextView.text else { return }
        diaryText[sectionIndex] = dText
        dismiss(animated: true)
 
    }

}
