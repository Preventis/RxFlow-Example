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
    var viewModel: InitViewModel?
    @IBOutlet weak var label: UILabel!

    // MARK: - Setter
    public func setViewModel(viewModel: InitViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = self.viewModel!.detailMessage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Action handlers
    @IBAction func mainButtonClicked(_ sender: Any) {
        guard let vm = self.viewModel else {
            return
        }
        vm.toInit()
    }
}
