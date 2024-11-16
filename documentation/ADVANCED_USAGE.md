
# Advanced Usage

This guide covers advanced topics like custom navigation paths, deep linking, and environment integration using your custom `Navigator` class and `Navigation` view in SwiftUI.

---

## 1. Custom Navigation Paths

To control the navigation stack more precisely, create a custom `NavigationPath` and initialize a `Navigator` with it.

**Example**

```swift
let customPath = NavigationPath()
let navigator = Navigator(path: customPath)

struct ContentView: View {
    var body: some View {
        Navigation(navigator: navigator) {
            HomeView()
        }
    }
}
```

In this example:

- **Custom Path**: A `NavigationPath` instance (`customPath`) is created to represent the desired navigation stack.
- **Initializing Navigator**: A `Navigator` is initialized with the custom path.
- **Using Navigation View**: The custom `Navigation` view is used, passing in the navigator and defining the root view.

---

## 2. Deep Linking

To handle deep links, initialize the `Navigator` with a predefined `NavigationPath` that represents the deep link path. Then, pass this navigator into the `Navigation` view to set up the deep link navigation stack.

**Steps to Deep Link**

1. **Create a Deep Link Path**: Parse the URL to create a `NavigationPath` representing the deep link.
2. **Initialize the Navigator**: Create a new `Navigator` instance with the deep link path.
3. **Pass the Navigator to the Navigation View**: Provide the navigator to the `Navigation` view to establish the navigation stack.

**Example**

```swift
func handleDeepLink(_ url: URL) -> some View {
    // Parse the URL to create a deep link path
    let deepLinkPath = parseURLToNavigationPath(url)

    // Initialize the navigator with the deep link path
    let navigator = Navigator(path: deepLinkPath)

    // Return the Navigation view with the navigator
    return Navigation(navigator: navigator) {
        HomeView()
    }
}

func parseURLToNavigationPath(_ url: URL) -> NavigationPath {
    var path = NavigationPath()
    // Implement your URL parsing logic here to append destinations
    // For example:
    if url.pathComponents.contains("detail") {
        path.append(DetailViewData(id: 123))
    }
    return path
}
```

**Explanation**

- **Parsing the URL**: `parseURLToNavigationPath(_:)` parses the incoming URL and constructs a `NavigationPath` by appending necessary destinations.
- **Initializing Navigator**: A new `Navigator` instance is created with the deep link path.
- **Passing Navigator**: By passing the navigator into the `Navigation` view, the navigation stack is set up according to the deep link path.

**Important Notes**

- **Navigator Initialization**: You cannot set the entire path of an existing `Navigator` after it has been created. Deep linking requires initializing a new `Navigator` with the desired path.
- **State Management**: Ensure that the `Navigator` instance is properly managed, especially if you're using state management solutions like `@StateObject` or `@EnvironmentObject`.

---

## 3. Clearing and Appending to the Navigation Path

If you need to handle deep linking within an existing navigation flow, you can clear the current navigation path using the `popToRoot()` function and then append new destinations using the `append(_:)` function provided by the `Navigator` class.

**Example**

```swift
struct ContentView: View {
    @EnvironmentObject var navigator: Navigator

    var body: some View {
        Navigation {
            HomeView()
                .onOpenURL { url in
                    handleDeepLink(url)
                }
        }
    }

    func handleDeepLink(_ url: URL) {
        // Parse the URL to determine the destinations
        if let destinations = parseURLToDestinations(url) {
            navigator.popToRoot()
            for destination in destinations {
                navigator.append(destination)
            }
        }
    }

    func parseURLToDestinations(_ url: URL) -> [AnyHashable]? {
        // Implement your URL parsing logic here
        // Return an array of destinations to navigate to
    }
}
```

**Explanation**

- **Clearing the Path**: `navigator.popToRoot()` clears the current navigation path and resets alerts, sheets, and confirmation dialogs.
- **Appending Destinations**: `navigator.append(_:)` appends new destinations to the navigation path.
- **Environment Object**: The `Navigator` is accessed via `@EnvironmentObject`, injected by the `Navigation` view.

---

## 4. Navigator Path Management Functions

Below are the relevant functions defined within the `Navigator` class for managing the navigation path:

```swift
@MainActor
open class Navigator: ObservableObject {
    /// The navigation path representing the current stack.
    @Published var path: NavigationPath

    // MARK: - Path Management

    /// Appends a value to the navigation path.
    /// - Parameter value: The value to append.
    public func append<Value: Hashable>(_ value: Value) {
        path.append(value)
    }

    /// Removes the last element(s) from the navigation path.
    /// - Parameter count: The number of elements to remove. Defaults to 1.
    public func removeLast(_ count: Int = 1) {
        path.removeLast(count)
    }

    /// Clears the navigation path and resets all dialogs and sheets.
    public func popToRoot() {
        alert = nil
        sheet = nil
        confirmDialog = nil
        path = NavigationPath()
    }

    // Other properties and methods...
}
```

**Note**: Properties like `alert`, `sheet`, and `confirmDialog` are defined within the `Navigator` class to manage alerts, sheets, and confirmation dialogs.

---

## 5. Integration with Environment

Since the `Navigator` is automatically injected by the `Navigation` view, you don't need to manually inject it into child views. Access it via `@EnvironmentObject` in your views.

**Example**

```swift
struct ContentView: View {
    var body: some View {
        Navigation {
            HomeView()
        }
    }
}

struct HomeView: View {
    @EnvironmentObject var navigator: Navigator

    var body: some View {
        // Use navigator here
    }
}
```

In this setup:

- **Navigation View**: The custom `Navigation` view injects the `Navigator` into the environment.
- **Child Views**: Access the `Navigator` using `@EnvironmentObject`.

---

## Summary

- **Deep Linking with Entire Path**: Initialize a new `Navigator` with a deep link path and pass it into the `Navigation` view.
- **Clearing and Appending Destinations**: Use `popToRoot()` and `append(_:)` to modify the navigation path of an existing `Navigator`.
- **Navigator Functions**: Familiarize yourself with the `Navigator` class functions for effective navigation management.

By following these guidelines, you can handle deep linking in your SwiftUI application using the `Navigator` class and ensure a seamless navigation experience.

---

## Additional Notes

1. **Custom Classes**: The `Navigator` and `Navigation` are custom implementations that provide additional functionality over SwiftUI's built-in navigation views. They manage navigation paths, alerts, sheets, and confirmation dialogs in a centralized manner.

2. **Consistency in Naming**: Ensure consistent usage of your custom `Navigation` view throughout your application to avoid confusion with SwiftUI's built-in `NavigationView` or `NavigationStack`.

3. **Handling of Alerts and Sheets**: The `Navigator` class includes properties like `alert`, `sheet`, and `confirmDialog` to manage modal presentations. These are reset in `popToRoot()` to ensure all modals are dismissed when navigating back to the root.

4. **Function Return Types**: In the `handleDeepLink(_:)` function, returning `some View` is appropriate if you're constructing a new view hierarchy based on the deep link. Ensure this aligns with your application's architecture.

5. **Use of Environment Objects**: The `Navigator` is injected into the environment by the `Navigation` view, so child views can access it via `@EnvironmentObject`.

6. **SwiftUI Compatibility**: The `Navigation` view uses `NavigationStack` internally, allowing you to benefit from SwiftUI's native navigation mechanisms while adding custom behavior through the `Navigator` class.

---

## What's Next?

Ready to dive deeper? Explore the **API Reference** for detailed information on public methods, properties, and structures in the **Navigation** framework.

**[Go to the API Reference →](API_OVERVIEW.md)**
**[Go to Patterns and Best Practices →](PATTERNS_BEST_PRACTICES.md)**
