# Usage Overview

This overview introduces you to the core features of the **Navigation** framework and guides you through basic setup and implementation.

## 1. Import the Framework

In your SwiftUI files, import **Navigation**:

```swift
import SwiftUI
import Navigation
```

## 2. Basic Setup

### 2.1 Using the `Navigation` View

Replace your existing `NavigationStack` with the `Navigation` view provided by the framework:

```swift
struct ContentView: View {
    var body: some View {
        Navigation {
            // Your root view content
            HomeView()
        }
    }
}
```

This automatically creates and injects a `Navigator` instance into the environment.

### 2.2 Accessing the `Navigator`

Since the `Navigator` is already injected into the environment by the `Navigation` view, you can access it in your child views using the `@EnvironmentObject` property wrapper:

```swift
struct SomeView: View {
    @EnvironmentObject var navigator: Navigator

    var body: some View {
        // Your view content
    }
}
```

## 3. Navigating Between Views

### 3.1 Using `NavigationLink`

Leverage SwiftUI's `NavigationLink` for standard navigation:

```swift
NavigationLink(value: YourDestinationType()) {
    Text("Go to Detail View")
}
.navigationDestination(
    for: YourDestinationType.self,
    destination: { destination in
        // Destination view
        DetailView(data: destination)
    }
)
```

### 3.2 Direct Navigation with `Navigator`

Programmatically navigate by modifying the navigation path:

```swift
navigator.append(
    YourDestinationType()
)
```

### 3.3 Using `NavigatorButton`

Simplify navigation with `NavigatorButton`:

```swift
NavigatorButton(
    action: { navigator in
        navigator.append(YourDestination())
    },
    label: {
        Text("Navigate")
    }
)
```

## 4. Presenting Modals and Alerts

### 4.1 Presenting a Sheet

```swift
navigator.sheet(
    content: {
        // Sheet content
        SheetView()
    },
    onDismiss: {
        // Optional dismissal action
    }
)
```

### 4.2 Displaying an Alert

```swift
navigator.alert(
    title: "Alert Title",
    message: {
        Text("This is an alert message.")
    },
    actions: {
        NavigatorButton("OK") { $0.dismiss() }
    }
)
```

### 4.3 Showing a Confirmation Dialog

```swift
navigator.confirmDialog(
    title: "Confirm Action",
    message: {
        Text("Are you sure you want to proceed?")
    },
    actions: {
        NavigatorButton("Yes") { $0.dismiss() }
        NavigatorButton("No") { $0.dismiss() }
    }
)
```

## 5. Dismissing Modals and Alerts

Use the `dismiss()` method to close the current modal or navigate back:

```swift
navigator.dismiss()
```

---

## What's Next?

Explore how to manage modals, alerts, and confirmation dialogs using the **Navigation** framework.

**[Go to Modals, Alerts, and Dialogs →](MODALS_ALERTS_DIALOGS.md)**
