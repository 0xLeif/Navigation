import SwiftUI

/// A central class for managing navigation paths, alerts, sheets, and confirmation dialogs.
@MainActor
open class Navigator: ObservableObject {
    /// Represents an alert dialog.
    public struct NavigatorAlert: Identifiable {
        /// The unique identifier of the alert.
        public let id: UUID
        /// The title of the alert.
        public let title: String
        /// The message content of the alert.
        public let message: AnyView
        /// The actions available in the alert.
        public let actions: AnyView

        /**
         Creates a new alert.

         - Parameters:
           - title: The title of the alert.
           - message: A `ViewBuilder` defining the alert's message.
           - actions: A `ViewBuilder` defining the alert's actions.
         */
        public init<Message: View, Actions: View>(
            title: String,
            @ViewBuilder message: () -> Message,
            @ViewBuilder actions: () -> Actions
        ) {
            self.id = UUID()
            self.title = title
            self.message = AnyView(message())
            self.actions = AnyView(actions())
        }
    }

    /// Represents a sheet dialog.
    public struct NavigatorSheet: Identifiable {
        /// The unique identifier of the sheet.
        public let id: UUID
        /// The content of the sheet.
        public let content: AnyView
        /// The closure executed when the sheet is dismissed.
        public let onDismiss: (() -> Void)?

        /**
         Creates a new sheet dialog.

         - Parameters:
           - content: A `ViewBuilder` defining the sheet's content.
           - onDismiss: An optional closure executed upon dismissal.
         */
        public init<Content: View>(
            @ViewBuilder content: () -> Content,
            onDismiss: (() -> Void)? = nil
        ) {
            self.id = UUID()
            self.content = AnyView(content())
            self.onDismiss = onDismiss
        }
    }

    /// Represents a confirmation dialog.
    public struct NavigatorConfirmDialog: Identifiable {
        /// The unique identifier of the dialog.
        public var id: UUID
        /// The title of the confirmation dialog.
        public let title: String
        /// The message content of the dialog.
        public let message: AnyView
        /// The actions available in the dialog.
        public let actions: AnyView

        /**
         Creates a new confirmation dialog.

         - Parameters:
           - title: The title of the dialog.
           - message: A `ViewBuilder` defining the dialog's message.
           - actions: A `ViewBuilder` defining the dialog's actions.
         */
        public init<Message: View, Actions: View>(
            title: String,
            @ViewBuilder message: () -> Message,
            @ViewBuilder actions: () -> Actions
        ) {
            self.id = UUID()
            self.title = title
            self.message = AnyView(message())
            self.actions = AnyView(actions())
        }
    }

    /// The navigation path representing the current stack.
    @Published var path: NavigationPath
    /// The currently presented alert, if any.
    @Published var alert: NavigatorAlert?
    /// The currently presented sheet, if any.
    @Published var sheet: NavigatorSheet?
    /// The currently presented confirmation dialog, if any.
    @Published var confirmDialog: NavigatorConfirmDialog?

    /// Creates a navigator with a path.
    public init(path: NavigationPath = NavigationPath()) {
        self.path = path
        self.alert = nil
        self.sheet = nil
        self.confirmDialog = nil
    }

    /// Creates a navigator with a path.
    public convenience init<Values: Sequence>(
        path: Values
    ) where Values.Element: Hashable {
        self.init(path: NavigationPath(path))
    }

    /// Creates a navigator with a path.
    public convenience init<Values: Sequence>(
        path: Values
    ) where Values.Element: Codable, Values.Element: Hashable {
        self.init(path: NavigationPath(path))
    }

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

    // MARK: - Alert

    /**
     Presents an alert with custom actions.

     - Parameters:
       - title: The title of the alert.
       - message: A `ViewBuilder` defining the alert's message.
       - actions: A `ViewBuilder` defining the alert's actions.
     */
    public func alert<Message: View, Actions: View>(
        title: String,
        @ViewBuilder message: () -> Message,
        @ViewBuilder actions: () -> Actions
    ) {
        alert = NavigatorAlert(
            title: title,
            message: message,
            actions: actions
        )
    }

    // MARK: - Sheet

    /**
     Presents a sheet dialog.

     - Parameters:
       - content: A `ViewBuilder` defining the sheet's content.
       - onDismiss: An optional closure executed upon dismissal.
     */
    public func sheet<Content: View>(
        @ViewBuilder content: () -> Content,
        onDismiss: (() -> Void)? = nil
    ) {
        sheet = NavigatorSheet(
            content: content,
            onDismiss: onDismiss
        )
    }

    // MARK: - Confirm Dialog

    /**
     Presents a confirmation dialog.

     - Parameters:
       - title: The title of the dialog.
       - message: A `ViewBuilder` defining the dialog's message.
       - actions: A `ViewBuilder` defining the dialog's actions.
     */
    public func confirmDialog<Content: View, Actions: View>(
        title: String,
        @ViewBuilder message: () -> Content,
        @ViewBuilder actions: () -> Actions
    ) {
        confirmDialog = NavigatorConfirmDialog(
            title: title,
            message: message,
            actions: actions
        )
    }

    /// Dismisses the current dialog or removes the last navigation path entry.
    public func dismiss() {
        if alert != nil {
            alert = nil
        } else if confirmDialog != nil {
            confirmDialog = nil
        } else if sheet != nil {
            sheet = nil
        } else {
            removeLast()
        }
    }
}
