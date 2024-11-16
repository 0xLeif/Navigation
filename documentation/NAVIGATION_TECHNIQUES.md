# Navigation Techniques

This guide covers various navigation methods using the `Navigator` class.

## 1. Using `NavigationLink` and `navigationDestination`

Leverage SwiftUI's `NavigationLink` with `navigationDestination`.

### Example

```swift
struct ContentView: View {
    var body: some View {
        Navigation(
            root: {
                List {
                    NavigationLink(value: DetailViewData()) {
                        Text("Detail View")
                    }
                }
            }
        )
        .navigationDestination(
            for: DetailViewData.self,
            destination: { data in
                DetailView(data: data)
            }
        )
    }
}
```

## 2. Direct Navigation with `Navigator`

Programmatically navigate by modifying the `Navigator`'s path.

### Example

```swift
struct ContentView: View {
    @EnvironmentObject var navigator: Navigator

    var body: some View {
        Button(
            action: {
                navigator.append(
                    DetailViewData()
                )
            },
            label: {
                Text("Go to Detail View")
            }
        )
    }
}
```

## 3. Simplified Navigation with `NavigatorButton`

Use `NavigatorButton` for a concise navigation button.

### Example

```swift
struct ContentView: View {
    var body: some View {
        NavigatorButton(
            destination: DetailViewData(),
            label: {
                Text("Navigate to Detail View")
            }
        )
    }
}
```

---

## What's Next?

Ready to unlock the full power of **Navigation**? Dive into advanced topics like custom navigation paths and deep linking.

**[Proceed to the Advanced Usage Guide →](ADVANCED_USAGE.md)**
