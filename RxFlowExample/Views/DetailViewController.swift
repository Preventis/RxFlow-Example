// DetailViewController.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 04.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.

import UIKit

class DetailViewController:  UIViewController {

    // MARK: - Properties
    var viewModel: AppViewModel?
    @IBOutlet weak var label: UILabel!

    // MARK: - Setter
    public func setViewModel(viewModel: AppViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Action handlers
    @IBAction func childFlowButtonClicked(_ sender: Any) {
        guard let vm = self.viewModel else {
            return
        }
        vm.toSetupFlow()
    }

    @IBAction func mainButtonClicked(_ sender: Any) {
        guard let vm = self.viewModel else {
            return
        }
        vm.toIntro()
    }
}
