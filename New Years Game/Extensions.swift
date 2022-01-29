//
//  Extensions.swift
//  New Years Game
//
//  Created by Sebastian Christiansen on 29/01/2022.
//

import Foundation
import UIKit

extension UIView {
    func addShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
    }
}
