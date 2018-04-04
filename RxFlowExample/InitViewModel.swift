// DemoViewModel.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 04.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.

import RxFlow

class InitViewModel: Stepper {
    let detailMessage = "Details"
    let initMessage = "Intro"

    public func toDetails() {
        self.step.accept(DemoStep.details)
    }

    public func toInit() {
        self.step.accept(DemoStep.dismiss)
    }
}
