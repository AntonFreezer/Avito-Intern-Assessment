//
//  UIView +.swift
//  Avito Intern Assessment
//
//  Created by Anton Kholodkov on 31.08.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
