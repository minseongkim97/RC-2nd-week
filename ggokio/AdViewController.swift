//
//  AdViewController.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/30.
//

import UIKit

class AdViewController: UIViewController {

    //MARK: - Property
    @IBOutlet weak var adImageView: UIImageView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let image: [UIImage] = [#imageLiteral(resourceName: "광고1"), #imageLiteral(resourceName: "광고2"), #imageLiteral(resourceName: "광고3")]
        adImageView.image = image.randomElement()
    }
    
    //MARK: - Action
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
