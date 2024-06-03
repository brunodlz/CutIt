import SwiftUI

final class AppThemeViewModel: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
}

struct DarkModeViewModifier: ViewModifier {
    @ObservedObject var appThemeViewModel: AppThemeViewModel = .init()

    func body(content: Content) -> some View {
        content
            .preferredColorScheme(appThemeViewModel.isDarkMode ? .dark : appThemeViewModel.isDarkMode == false ? .light : nil)
    }
}
