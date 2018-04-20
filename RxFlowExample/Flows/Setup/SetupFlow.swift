// DemoChildFlow.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 06.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.
    

import Foundation
import RxFlow

class SetupFlow: Flow {
    // MARK: - Properties
    var root: Presentable {
        return self.rootViewController
    }
    private let flowCompletionStep: Step
    private let viewModel = SetupViewModel()
    private let rootViewController = UINavigationController()

    // MARK: - init
    public init(completeWith step: Step) {
        self.flowCompletionStep = step
    }

    // MARK: - Navigation step switch
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? SetupStep else { return NextFlowItems.none }
        switch step {
            case .step1:
                return self.navigateToStep1()
            case .step2:
                return self.navigateToStep2()
            case .exit:
                return self.exitFlow()
        }
    }
}

// MARK: - Navigate to setup step 1
extension SetupFlow {
    private func navigateToStep1() -> NextFlowItems {
        let storyboard = UIStoryboard(name: "SetupStep1", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SetupStep1") as! SetupStep1ViewController
        viewController.setViewModel(viewModel: self.viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)
        let nextFlowItem = NextFlowItem(nextPresentable: viewController, nextStepper: viewModel)
        return NextFlowItems.one(flowItem: nextFlowItem)
    }
}

// MARK: - Navigate to setup step 2
extension SetupFlow {
    private func navigateToStep2() -> NextFlowItems {
        let storyboard = UIStoryboard(name: "SetupStep2", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SetupStep2") as! SetupStep2ViewController
        viewController.setViewModel(viewModel: self.viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)
        let nextFlowItem = NextFlowItem(nextPresentable: viewController, nextStepper: viewModel)
        return NextFlowItems.one(flowItem: nextFlowItem)
    }
}

// MARK: - Exit the setup flow
extension SetupFlow {
    private func exitFlow() -> NextFlowItems {
        self.rootViewController.dismiss(animated: true, completion: nil)
        return NextFlowItems.end(withStepForParentFlow: self.flowCompletionStep)
    }
}
