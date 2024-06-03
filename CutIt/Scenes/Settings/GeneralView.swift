import SwiftUI

enum DisplayMode: String, Hashable, Identifiable {
    var id: Self { self }
    case system, light, dark
}

struct GeneralView: View {
    @AppStorage("displayMode") private var displayMode: DisplayMode = .system

    @AppStorage("appearanceSelection") private var appearanceSelection: Int = 0

    @State var preferredColorScheme: ColorScheme? = nil

    private var preferredDesign: ColorScheme? {
        switch displayMode {
            case .dark:
                return .dark
            case .light:
                return .light
            case .system:
                return nil
        }
    }

    @State private var isStartLogin = false

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Start:")
                    .font(.title3)

                Toggle(isOn: $isStartLogin) {
                    Text("Start at login")
                        .font(.title3)
                }
            }

            Divider()

            HStack(alignment: .center) {
                Text("Apparecence:")
                    .font(.title3)

                Picker("", selection: $appearanceSelection) {
                    Text("System")
                        .tag(0)
                    Divider()
                    Text("Light")
                        .tag(1)
                    Text("Dark")
                        .tag(2)
                }
                .pickerStyle(.menu)
                .frame(width: 160)
            }
        }
        .frame(width: 360,
               height: 100)
        .preferredColorScheme(preferredDesign)
    }
}

#Preview {
    GeneralView()
}
