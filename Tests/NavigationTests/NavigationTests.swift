import SwiftUI
import Testing

@testable import Navigation

@Test("Navigator Initialization")
@MainActor
func testNavigatorInitialization() {
    let navigator = Navigator()
    #expect(navigator.path.isEmpty, "Navigator should initialize with an empty path.")
    #expect(navigator.alert == nil, "Navigator should initialize without an alert.")
    #expect(navigator.sheet == nil, "Navigator should initialize without a sheet.")
    #expect(navigator.confirmDialog == nil, "Navigator should initialize without a confirmation dialog.")
}

@Test("Navigator Initialization Hashable Path")
@MainActor
func testNavigatorInitializationHashablePath() {
    enum Path: Hashable {
        case testPath
    }
    let navigator = Navigator(path: [Path.testPath])
    #expect(navigator.path.isEmpty == false, "Navigator should initialize with a path.")
    #expect(navigator.alert == nil, "Navigator should initialize without an alert.")
    #expect(navigator.sheet == nil, "Navigator should initialize without a sheet.")
    #expect(navigator.confirmDialog == nil, "Navigator should initialize without a confirmation dialog.")
}

@Test("Navigator Initialization Codable Path")
@MainActor
func testNavigatorInitializationCodablePath() {
    let navigator = Navigator(path: ["TestPath"])
    #expect(navigator.path.isEmpty == false, "Navigator should initialize with a path.")
    #expect(navigator.alert == nil, "Navigator should initialize without an alert.")
    #expect(navigator.sheet == nil, "Navigator should initialize without a sheet.")
    #expect(navigator.confirmDialog == nil, "Navigator should initialize without a confirmation dialog.")
}

@Test("Append to Path")
@MainActor
func testAppendToPath() {
    let navigator = Navigator()
    navigator.append("TestPath")
    #expect(navigator.path.count == 1, "Navigator path should contain one element.")
}

@Test("Remove Last from Path")
@MainActor
func testRemoveLastFromPath() {
    let navigator = Navigator()
    navigator.append("TestPath")
    navigator.dismiss()
    #expect(navigator.path.isEmpty, "Navigator path should be empty after removing the last element.")
}

@Test("Pop to Root")
@MainActor
func testPopToRoot() {
    let navigator = Navigator()
    navigator.append("Path1")
    navigator.append("Path2")
    navigator.popToRoot()
    #expect(navigator.path.isEmpty, "Navigator path should be empty after popping to root.")
    #expect(navigator.alert == nil, "Navigator should reset alert after popping to root.")
    #expect(navigator.sheet == nil, "Navigator should reset sheet after popping to root.")
    #expect(navigator.confirmDialog == nil, "Navigator should reset confirmation dialog after popping to root.")
}

@Test("Alert Presentation")
@MainActor
func testAlertPresentation() {
    let navigator = Navigator()
    navigator.alert(title: "Test Alert", message: { Text("") }, actions: {
        NavigatorButton("OK", action: { $0.dismiss() })
    })
    #expect(navigator.alert != nil, "Navigator should present an alert.")
    #expect(navigator.alert?.title == "Test Alert", "Navigator alert should have the correct title.")
}

@Test("Dismiss Alert")
@MainActor
func testDismissAlert() {
    let navigator = Navigator()
    navigator.alert(title: "Dismiss Alert", message: EmptyView.init, actions: EmptyView.init)
    navigator.dismiss()
    #expect(navigator.alert == nil, "Navigator alert should be nil after dismissal.")
}

@Test("Sheet Presentation")
@MainActor
func testSheetPresentation() {
    let navigator = Navigator()
    navigator.sheet {
        Text("Sheet Content")
    }
    #expect(navigator.sheet != nil, "Navigator should present a sheet.")
}

@Test("Dismiss Sheet")
@MainActor
func testDismissSheet() {
    let navigator = Navigator()
    navigator.sheet {
        Text("Sheet Content")
    }
    navigator.dismiss()
    #expect(navigator.sheet == nil, "Navigator sheet should be nil after dismissal.")
}

@Test("Confirmation Dialog Presentation")
@MainActor
func testConfirmationDialogPresentation() {
    let navigator = Navigator()
    navigator.confirmDialog(
        title: "Confirm Dialog",
        message: { Text("Are you sure?") },
        actions: {
            NavigatorButton("Yes", action: { $0.dismiss() })
        }
    )
    #expect(navigator.confirmDialog != nil, "Navigator should present a confirmation dialog.")
    #expect(navigator.confirmDialog?.title == "Confirm Dialog", "Navigator confirmation dialog should have the correct title.")
}

@Test("Dismiss Confirmation Dialog")
@MainActor
func testDismissConfirmationDialog() {
    let navigator = Navigator()
    navigator.confirmDialog(
        title: "Dismiss Dialog",
        message: { Text("Message") },
        actions: {
            NavigatorButton("Dismiss", action: { $0.dismiss() })
        }
    )
    navigator.dismiss()
    #expect(navigator.confirmDialog == nil, "Navigator confirmation dialog should be nil after dismissal.")
}
