// ExampleButton.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 20.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.
    

import Foundation
import UIKit

class ExampleButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.layer.frame.height / 2.0
    }
}
