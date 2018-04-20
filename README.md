# [RxFlow](https://github.com/RxSwiftCommunity/RxFlow) Example

Example application to demonstrate the usage of
[RxFlow](https://github.com/RxSwiftCommunity/RxFlow) and issues/misbehaviors we
experienced with custom `Stepper` implementations.

### Setup
Install [CocoaPods](https://cocoapods.org/)
1. `pod install`
2. `open RxFlowExample.xcworkspace`

### Branches
- [master](https://github.com/Preventis/RxFlow-Example/tree/master) Working
  example using a `OneStepper` as an initial Stepper in `AppDelegate`
- [misbehavior](https://github.com/Preventis/RxFlow-Example/tree/misbehavior)
  Example with misbehaviors when implementing `AppViewModel` as a Stepper
