// ViewController.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 04.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.
    

import UIKit

class IntroViewController: UIViewController {

    // MARK: - Properties
    public var viewModel: InitViewModel?
    @IBOutlet weak var label: UILabel!

    // MARK: - Setter
    public func setViewModel(viewModel: InitViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = self.viewModel!.initMessage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Action handlers
    @IBAction func toDetailsButtonClicked(_ sender: Any) {
        guard let vm = self.viewModel else {
            return
        }
        vm.toDetails()
    }
}

