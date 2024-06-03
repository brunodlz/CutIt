import SwiftUI

struct SettingsView: View {
    private enum Tabs: Hashable {
        case general
    }

    var body: some View {
        TabView {
            GeneralView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag(Tabs.general)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
