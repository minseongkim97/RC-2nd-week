//
//  CornerButton.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/07/02.
//

import UIKit

class CornerButton: UIButton {
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
