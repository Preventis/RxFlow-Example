// AppDelegate.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 04.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.

import RxFlow
import RxSwift
import UIKit

extension StoryboardInitializable where Self: UIViewController {
    public static var bundle: Bundle {
        return Bundle.main
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    let disposeBag = DisposeBag()
    var window: UIWindow?
    var coordinator = Coordinator()
    var viewModel = AppViewModel()
    lazy var appFlow = {
        return AppFlow(stepper: self.viewModel)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let window = self.window else { return false }
        coordinator.rx.didNavigate.subscribe(
          onNext: { (flow, step) in
              print("Did navigate to flow=\(flow) and step=\(step)")
          }).disposed(by: self.disposeBag)
        Flows.whenReady(
            flow1: self.appFlow,
            block: { [unowned window] (root) in
              window.rootViewController = root
          }
        )
        // DOESN'T WORK: Using the AppViewModel as a stepper produces
        // strange side effects:
        // - Emission of two steps, when only one step should be triggered
        coordinator.coordinate(
            flow: self.appFlow,
            withStepper: self.viewModel
        )
        // WORKS: Ensure using a OneStepper works
        /*
        coordinator.coordinate(
            flow: self.appFlow,
            withStepper: OneStepper(withSingleStep: AppStep.intro)
        )
        */
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

