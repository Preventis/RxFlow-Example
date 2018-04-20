// ChildAViewController.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 06.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.

import Foundation
import UIKit


extension StoryboardInitializable where Self: SetupStep1ViewController {
    static var storyboardIdentifier: String {
        return "SetupStep1"
    }
}

final class SetupStep1ViewController: UIViewController, StoryboardInitializable {

    // Properties
    var viewModel: SetupViewModel?

    // MARK: - Setter
    public func setViewModel(viewModel: SetupViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Action handler
    @IBAction func buttonClicked(_ sender: Any) {
        guard let viewModel = self.viewModel else {
            return
        }
        viewModel.toStep2()
    }
}
