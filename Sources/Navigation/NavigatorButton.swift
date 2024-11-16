import SwiftUI

/// A customizable button for navigation actions.
public struct NavigatorButton<Content: View>: View {
    @EnvironmentObject var navigator: Navigator

    private let action: (Navigator) -> Void
    private let content: () -> Content

    /// Creates a button with a custom action and content.
    /// - Parameters:
    ///   - action: The action to execute when the button is pressed.
    ///   - content: A `ViewBuilder` for defining the button's content.
    public init(
        action: @escaping (Navigator) -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.action = action
        self.content = content
    }

    /// Convenience initializer for a button with a `Text` label.
    /// - Parameters:
    ///   - title: The button's title as `Text`.
    ///   - action: The action to execute when the button is pressed.
    public init(
        _ title: Text,
        action: @escaping (Navigator) -> Void
    ) where Content == Text {
        self.init(action: action) {
            title
        }
    }

    /// Convenience initializer for a button with a `String` title.
    /// - Parameters:
    ///   - title: The button's title as `String`.
    ///   - action: The action to execute when the button is pressed.
    public init(
        _ title: String,
        action: @escaping (Navigator) -> Void
    ) where Content == Text {
        self.init(Text(title), action: action)
    }

    public var body: some View {
        Button(
            action: {
                action(navigator)
            },
            label: {
                content()
            }
        )
    }
}
