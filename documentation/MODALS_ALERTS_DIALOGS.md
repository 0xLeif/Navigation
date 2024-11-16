# Modals, Alerts, and Dialogs

Learn how to present sheets, alerts, and confirmation dialogs using the `Navigator`.

## 1. Presenting Sheets

### Syntax

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

### Example

```swift
navigator.sheet(
    content: {
        VStack {
            Text("Sheet Content")
            Button(
                action: {
                    navigator.dismiss()
                },
                label: {
                    Text("Close")
                }
            )
        }
    }
)
```

## 2. Displaying Alerts

### Syntax

```swift
navigator.alert(
    title: "Alert Title",
    message: {
        // Alert message view
        Text("This is an alert.")
    },
    actions: {
        // Alert actions
        NavigatorButton("OK") { $0.dismiss() }
    }
)
```

### Example

```swift
navigator.alert(
    title: "Network Error",
    message: {
        Text("Unable to connect to the server.")
    },
    actions: {
        NavigatorButton("Retry") {
            // Retry action
            $0.dismiss()
        }
        NavigatorButton("Cancel") { $0.dismiss() }
    }
)
```

## 3. Showing Confirmation Dialogs

### Syntax

```swift
navigator.confirmDialog(
    title: "Confirm Action",
    message: {
        // Dialog message view
        Text("Are you sure you want to proceed?")
    },
    actions: {
        // Dialog actions
        NavigatorButton("Yes") { $0.dismiss() }
        NavigatorButton("No") { $0.dismiss() }
    }
)
```

### Example

```swift
navigator.confirmDialog(
    title: "Delete Item",
    message: {
        Text("Are you sure you want to delete this item?")
    },
    actions: {
        NavigatorButton("Delete") {
            // Delete action
            $0.dismiss()
        }
        NavigatorButton("Cancel") { $0.dismiss() }
    }
)
```

## 4. Dismissing Modals and Alerts

Use `navigator.dismiss()` to close the current modal or alert.

### Example

```swift
Button(
    action: {
        navigator.dismiss()
    },
    label: {
        Text("Dismiss")
    }
)
```

---

## What's Next?

Learn how to implement various navigation techniques to enhance your application's user experience.

**[Go to Navigation Techniques →](NAVIGATION_TECHNIQUES.md)**
