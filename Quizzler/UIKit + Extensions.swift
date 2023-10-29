//
//  UIKit + Extensions.swift
//  Quizzler
//
//  Created by Сазонов Станислав on 29.10.2023.
//

import UIKit

extension UIButton {
    convenience init(buttonText: String) {
        self.init(type: .system)
        
        self.titleLabel?.font = .systemFont(ofSize: 25)
        self.tintColor = .white
        self.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 25)
        self.setTitle(buttonText, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
