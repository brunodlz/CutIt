import SwiftUI

struct GeneralView: View {
    @AppStorage("launchAtLogin") private var launchAtLogin = false

    var body: some View {
        VStack {
            Toggle(isOn: $launchAtLogin) {
                Text("Start at login")
                    .font(.title3)
            }
            .toggleStyle(SwitchToggleStyle(tint: .cyan))
        }
        .frame(width: 140, height: 30)
    }
}

#Preview {
    GeneralView()
}
