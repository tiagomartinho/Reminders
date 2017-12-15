# Reminders iOS

An iOS application written in Swift to demonstrate how to implement a Clean Architecture in iOS.

## Idea

The idea is to implement the simplest To-Do List app. The user can add a Reminder with a Title and visualize the existing Reminders in a list.

## CI Status

[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=5a2ecd23fa115200016a72b8&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/5a2ecd23fa115200016a72b8/build/latest?branch=master)

## Requirements

* macOS 10.13 or higher
* Xcode 9.2 or higher

## Installation

To compile/run the iOS application:
* open the Xcode Project "Reminders.xcodeproj"
* select the "Reminders" iOS scheme
* Run by pressing "Play" or by pressing [Cmd + R]

## Tests

We use [XCTest](https://developer.apple.com/documentation/xctest) for the Unit and UI tests.

To run the tests for the iOS application:
* open the Xcode Project "Reminders.xcodeproj"
* select the "Reminders" iOS scheme
* Run by pressing "Product" > "Test" or by pressing [Cmd + U]

## Possible Improvements

* Use a Mocking framework to remove Mocks and Spies in tests
* Use a Dependency Injection framework to improve ControllerFactory
* Refactor RemindersEndToEndTest
* Refactor RemindersPresenterTest
* Refactor AddReminderPresenterTest
* Extract business logic in Presenters into Use Cases
* Remove Route dependency in ControllerFactory
* Replace conditional in AppRouter
