import RxFlow

class SetupViewModel: Stepper {
    init() {
        self.toStep1()
    }

    public func toStep1() {
        self.step.accept(SetupStep.step1)
    }

    public func toStep2() {
        self.step.accept(SetupStep.step2)
    }

    public func exit() {
        self.step.accept(SetupStep.exit)
    }
}
