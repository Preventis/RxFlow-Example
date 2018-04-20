import RxFlow

class AppFlow: Flow {
    // MARK: - Properties
    var root: Presentable {
        return self.rootViewController
    }
    private let viewModel: AppViewModel
    private lazy var rootViewController: UINavigationController = {
        let vc = UINavigationController()
        vc.setNavigationBarHidden(false, animated: true)
        return vc
    }()

    // MARK: - Init
    init(stepper viewModel: AppViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Navigation switch
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? AppStep else { return NextFlowItems.none }
        switch step {
        case .intro:
            return navigateToIntro()
        case .details:
            return navigateToDetails()
        case .setupFlow:
            return navigateToSetupFlow()
        case .finish:
            return navigateToFinish()
        }
    }
}

// MARK: - Navigate to Intro
extension AppFlow {
    private func navigateToIntro() -> NextFlowItems {
        let storyboard = UIStoryboard(name: "Intro", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Intro") as? IntroViewController
        viewController?.setViewModel(viewModel: self.viewModel)
        self.rootViewController.pushViewController(viewController!, animated: true)
        let nextFlowItem = NextFlowItem(nextPresentable: viewController!, nextStepper: viewModel)
        return NextFlowItems.one(flowItem: nextFlowItem)
    }
}

// MARK: - Navigate to Details
extension AppFlow {
    private func navigateToDetails() -> NextFlowItems {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Details") as? DetailViewController
        viewController?.setViewModel(viewModel: self.viewModel)
        let nextFlowItem = NextFlowItem(nextPresentable: viewController!, nextStepper: viewModel)
        self.rootViewController.pushViewController(viewController!, animated: true)
        return NextFlowItems.one(flowItem: nextFlowItem)
    }
}

// MARK: - Navigate to Setup flow
extension AppFlow {
    private func navigateToSetupFlow() -> NextFlowItems {
        let setupViewModel = SetupViewModel()
        let setupFlow = SetupFlow(completeWith: AppStep.finish)
        Flows.whenReady(flow1: setupFlow, block: { [unowned self] (root) in
            self.rootViewController.present(root, animated: true) {
                print("Root view controller presented setupFlow")
            }
        })
        /*
        let nextFlowItem = NextFlowItem(
            nextPresentable: setupFlow,
            nextStepper: OneStepper(withSingleStep: SetupStep.step1)
        )
        */
        let nextFlowItem = NextFlowItem(
            nextPresentable: setupFlow,
            nextStepper: setupViewModel
        )
        return NextFlowItems.one(flowItem: nextFlowItem)
    }
}

// MARK: - Navigate to Finish
extension AppFlow {
    private func navigateToFinish() -> NextFlowItems {
        let storyboard = UIStoryboard(name: "Finished", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Finished") as? FinishedViewController
        viewController?.setViewModel(self.viewModel)
        let nextFlowItem = NextFlowItem(nextPresentable: viewController!, nextStepper: viewModel)
        self.rootViewController.pushViewController(viewController!, animated: true)
        return NextFlowItems.one(flowItem: nextFlowItem)
    }
}
