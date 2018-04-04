
import RxFlow

class DemoFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private let viewModel = InitViewModel()
    private let rootViewController = UINavigationController()

    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? DemoStep else { return NextFlowItems.none }

        switch step {
        case .intro:
            return navigateToIntro()
        case .details:
            return navigateToDetails()
        case .dismiss:
            return dismiss()
        }
    }

    private func dismiss() -> NextFlowItems {
        self.rootViewController.dismiss(animated: true)
        return NextFlowItems.none
    }

    private func navigateToIntro() -> NextFlowItems {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main") as! IntroViewController
        viewController.setViewModel(viewModel: self.viewModel)
        self.rootViewController.pushViewController(viewController, animated: true)
        let nextFlowItem = NextFlowItem(nextPresentable: viewController, nextStepper: viewModel)
        return NextFlowItems.one(flowItem: nextFlowItem)
    }

    private func navigateToDetails() -> NextFlowItems {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Details") as! DetailViewController
        viewController.setViewModel(viewModel: self.viewModel)
        let nextFlowItem = NextFlowItem(nextPresentable: viewController, nextStepper: viewModel)
        self.rootViewController.present(viewController, animated: true)
        return NextFlowItems.one(flowItem: nextFlowItem)
    }
}
