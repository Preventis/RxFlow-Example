// StoryboardInitializable.swift
//
// - Authors:
// Guido Schmidt
//
// - Date: 06.04.18
//
// Copyright © 2018 Guido Schmidt. All rights reserved.
    
import UIKit

/// Convenience protocol for easier VC initialization.
public protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
    static var controllerIdentifier: String { get }
    static var bundle: Bundle { get }
}

/// Default implementation for `UIViewController`.
extension StoryboardInitializable where Self: UIViewController {
    public static var controllerIdentifier: String {
        return String(describing: Self.self)
    }

    public static func initFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: self.bundle)
        return storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as! Self
    }
}
