// DemoViewModel.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 04.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.

import RxFlow

class AppViewModel: Stepper {
    init() {
        self.step.accept(AppStep.intro)
    }

    public func toDetails() {
        self.step.accept(AppStep.details)
    }

    public func toIntro() {
        self.step.accept(AppStep.intro)
    }

    public func toSetupFlow() {
        self.step.accept(AppStep.setupFlow)
    }

    public func toFinished() {
        self.step.accept(AppStep.intro)
    }
}
