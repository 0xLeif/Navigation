# API Overview

Get a comprehensive overview of the `Navigator` API and its components.

## 1. `Navigator` Class

Central class for managing navigation paths and modals.

### Properties

- `path: NavigationPath` - Represents the current navigation stack.
- `alert: NavigatorAlert?` - The currently presented alert.
- `sheet: NavigatorSheet?` - The currently presented sheet.
- `confirmDialog: NavigatorConfirmDialog?` - The currently presented confirmation dialog.

### Methods

- **append(_ value: Hashable)** - Navigate to a new view.

  ```swift
  navigator.append(
      YourDestination()
  )
  ```

- **removeLast(_ count: Int = 1)** - Navigate back by removing views from the stack.

  ```swift
  navigator.removeLast(
      count: 2
  )
  ```

- **popToRoot()** - Reset navigation to the root view.

  ```swift
  navigator.popToRoot()
  ```

- **alert(title:message:actions:)** - Present an alert.

  ```swift
  navigator.alert(
      title: "Alert Title",
      message: {
          Text("Alert Message")
      },
      actions: {
          NavigatorButton("OK") { $0.dismiss() }
      }
  )
  ```

- **sheet(content:onDismiss:)** - Present a sheet.

  ```swift
  navigator.sheet(
      content: {
          SheetView()
      },
      onDismiss: {
          // Optional dismissal action
      }
  )
  ```

- **confirmDialog(title:message:actions:)** - Present a confirmation dialog.

  ```swift
  navigator.confirmDialog(
      title: "Confirm Action",
      message: {
          Text("Are you sure?")
      },
      actions: {
          NavigatorButton("Yes") { $0.dismiss() }
          NavigatorButton("No") { $0.dismiss() }
      }
  )
  ```

- **dismiss()** - Dismiss the current modal or navigate back.

  ```swift
  navigator.dismiss()
  ```
  
---

## What's Next?

Discover patterns and best practices to design scalable and maintainable navigation flows.

**[Go to Patterns and Best Practices →](PATTERNS_BEST_PRACTICES.md)**
