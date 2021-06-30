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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
