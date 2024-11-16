# Navigation Framework for SwiftUI

[![macOS Build](https://img.shields.io/github/actions/workflow/status/0xLeif/Navigation/macOS.yml?label=macOS&branch=main)](https://github.com/0xLeif/Navigation/actions/workflows/macOS.yml)
[![License](https://img.shields.io/github/license/0xLeif/Navigation)](https://github.com/0xLeif/Navigation/blob/main/LICENSE)
[![Version](https://img.shields.io/github/v/release/0xLeif/Navigation)](https://github.com/0xLeif/Navigation/releases)

**Navigation** is a SwiftUI framework that simplifies and enhances navigation in your applications. It centralizes state management through the `Navigator` class, making it easier to handle navigation actions, sheets, alerts, and confirmation dialogs.

## Requirements

- **iOS**: 16.0+
- **macOS**: 13.0+
- **tvOS**: 16.0+
- **watchOS**: 9.0+
- **Swift**: 6.0+
- **Xcode**: 16.0+

## Key Features

**Navigation** offers powerful tools for managing navigation state:

- **Centralized State Management**: Use the `Navigator` class to manage navigation actions, alerts, sheets, and confirmation dialogs.
- **Automatic Navigator Injection**: The `Navigation` view automatically creates and injects a `Navigator` into the environment.
- **Environment Access**: Access the `Navigator` throughout your app via `@EnvironmentObject`.
- **Seamless SwiftUI Integration**: Works smoothly with SwiftUI's `NavigationStack`, `NavigationLink`, and `navigationDestination`.
- **Simplified UI Components**: Manage sheets, alerts, and confirmation dialogs without multiple `@State` variables.
- **Type-Safe Navigation**: Ensure type safety by using custom `Hashable` data types for navigation.
- **Programmatic Navigation**: Support dynamic navigation flows by pushing and popping views based on conditions or events.

## Getting Started

To add **Navigation** to your SwiftUI project, follow the detailed instructions in the [Installation Guide](INSTALLATION.md).

After installation, refer to the [Usage Overview](USAGE_OVERVIEW.md) for a quick introduction on setting up and using the framework.

## Documentation

Explore **Navigation**'s documentation to get the most out of the framework:

- [Installation Guide](documentation/INSTALLATION.md): Steps to add **Navigation** to your project using Swift Package Manager.
- [Usage Overview](documentation/USAGE_OVERVIEW.md): A quick start guide with key features and example implementations.

### Detailed Usage Guides

- [Navigation Techniques](documentation/NAVIGATION_TECHNIQUES.md): Discover various navigation methods using the `Navigator`, including pushing and popping views, `NavigationLink`, and `NavigatorButton`.
- [Modals, Alerts, and Dialogs](documentation/MODALS_ALERTS_DIALOGS.md): Learn how to present sheets, alerts, and confirmation dialogs using the `Navigator`.
- [Advanced Usage](documentation/ADVANCED_USAGE.md): Delve into advanced topics like custom navigation actions, deep linking, and environment integration.
- [Patterns and Best Practices](documentation/PATTERNS_BEST_PRACTICES.md): Improve your app's navigation architecture by following best practices.
- [API Overview](documentation/API_OVERVIEW.md): A comprehensive overview of the `Navigator` API.

## Next Steps

With **Navigation** installed, start exploring its features by reading the [Usage Overview](documentation/USAGE_OVERVIEW.md) and the detailed guides. Begin managing navigation effectively in your SwiftUI projects. For advanced techniques, consult the [Advanced Usage Guide](documentation/ADVANCED_USAGE.md).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
