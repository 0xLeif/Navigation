import SwiftUI

/// A SwiftUI container for managing navigation paths and dialogs.
public struct Navigation<Root: View>: View {
    @ObservedObject private var navigator: Navigator

    private let isAppAlertPresented: Binding<Bool>
    private let isSheetAlertPresented: Binding<Bool>
    private let isAppConfirmPresented: Binding<Bool>
    private let isSheetConfirmPresented: Binding<Bool>
    private let root: (Navigator) -> Root

    /// Creates a navigation container with a custom root view.
    /// - Parameters:
    ///   - navigator: An optional `Navigator` instance.
    ///   - root: A closure to define the root view.
    public init(
        navigator: Navigator = Navigator(),
        @ViewBuilder root: @escaping (Navigator) -> Root
    ) {
        self.navigator = navigator
        self.isAppAlertPresented = Binding(
            get: {
                navigator.alert != nil && navigator.sheet == nil
            },
            set: { newValue in
                if newValue == false {
                    navigator.alert = nil
                }
            }
        )
        self.isSheetAlertPresented = Binding(
            get: {
                navigator.alert != nil && navigator.sheet != nil
            },
            set: { newValue in
                if newValue == false {
                    navigator.alert = nil
                }
            }
        )
        self.isAppConfirmPresented = Binding(
            get: {
                navigator.confirmDialog != nil && navigator.sheet == nil
            },
            set: { newValue in
                if newValue == false {
                    navigator.confirmDialog = nil
                }
            }
        )
        self.isSheetConfirmPresented = Binding(
            get: {
                navigator.confirmDialog != nil && navigator.confirmDialog != nil
            },
            set: { newValue in
                if newValue == false {
                    navigator.confirmDialog = nil
                }
            }
        )
        self.root = root
    }

    /// Creates a navigation container with a custom root view.
    /// - Parameters:
    ///   - navigator: An optional `Navigator` instance.
    ///   - root: A closure to define the root view.
    public init(
        navigator: Navigator = Navigator(),
        @ViewBuilder root: @escaping () -> Root
    ) {
        self.init(
            navigator: navigator,
            root: { _ in root() }
        )
    }

    public var body: some View {
        NavigationStack(path: $navigator.path) {
            root(navigator)
        }
        .alert(
            navigator.alert?.title ?? "",
            isPresented: isAppAlertPresented,
            presenting: navigator.alert,
            actions: \.actions,
            message: \.message
        )
        .confirmationDialog(
            navigator.confirmDialog?.title ?? "",
            isPresented: isAppConfirmPresented,
            titleVisibility: .automatic,
            presenting: navigator.confirmDialog,
            actions: \.actions,
            message: \.message
        )
        .sheet(
            item: $navigator.sheet,
            onDismiss: {
                navigator.sheet?.onDismiss?()
            },
            content: { sheet in
                sheet.content
                .alert(
                    navigator.alert?.title ?? "",
                    isPresented: isSheetAlertPresented,
                    presenting: navigator.alert,
                    actions: \.actions,
                    message: \.message
                )
                .confirmationDialog(
                    navigator.confirmDialog?.title ?? "",
                    isPresented: isSheetConfirmPresented,
                    titleVisibility: .automatic,
                    presenting: navigator.confirmDialog,
                    actions: \.actions,
                    message: \.message
                )
            }
        )
        .environmentObject(navigator)
    }
}
