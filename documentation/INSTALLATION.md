# Installation Guide

This guide will help you add **Navigation** to your SwiftUI project using Swift Package Manager (SPM).

## 1. Using Xcode

### Step 1: Open Your Project

Open your Xcode project where you want to add the **Navigation** framework.

### Step 2: Add Package Dependency

- Go to **File > Swift Packages > Add Package Dependency...**
- Alternatively, right-click on your project in the Project Navigator and select **Add Packages...**

### Step 3: Enter Package Repository URL

In the search bar, enter the **Navigation** GitHub repository URL:

```
https://github.com/0xLeif/Navigation
```

### Step 4: Choose Dependency Rules

Select the version of **Navigation** you wish to install. It's recommended to use the latest stable release.

### Step 5: Add Package

Click **Add Package** to add it to your project.

### Step 6: Select Target

Choose the target(s) where you want to use **Navigation**.

### Step 7: Finish

Click **Finish** to complete the installation.

## 2. Using Package.swift

If you're using a `Package.swift` file, add **Navigation** to your dependencies:

```swift
dependencies: [
    .package(
      url: "https://github.com/0xLeif/Navigation",
      from: "1.0.0"
    )
],
```

Include it in your target dependencies:

```swift
targets: [
    .target(
        name: "YourTargetName",
        dependencies: [
            .product(
              name: "Navigation",
              package: "Navigation"
            )
        ]
    )
]
```

Specify the supported platforms:

```swift
platforms: [
    .iOS(.v16),
    .macOS(.v13),
    .tvOS(.v16),
    .watchOS(.v9)
]
```

## 3. Requirements

Ensure your development environment meets the following requirements:

- **Swift**: 6.0 or later
- **Xcode**: 16.0 or later
- **Platforms**:
  - **iOS**: 16.0+
  - **macOS**: 13.0+
  - **tvOS**: 16.0+
  - **watchOS**: 9.0+
  
---

## What's Next?

Now that you’ve installed **Navigation**, get an overview of its basic functionality and API.

**[Proceed to the Usage and API Overview →](USAGE_OVERVIEW.md)**
