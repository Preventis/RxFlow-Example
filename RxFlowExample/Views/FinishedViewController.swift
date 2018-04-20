// FinishedViewController.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 20.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.
    

import Foundation
import UIKit

class FinishedViewController: UIViewController {
    // MARK: - Properties
    private var viewModel: AppViewModel?

    // MARK: - Setter
    public func setViewModel(_ viewModel: AppViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Action handlers
    @IBAction func restartButtonTouched(_ sender: Any) {
        guard let viewModel = self.viewModel else {
            return
        }
        viewModel.toFinished()
    }
}
