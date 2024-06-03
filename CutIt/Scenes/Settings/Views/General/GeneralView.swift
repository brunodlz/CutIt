import SwiftUI

struct GeneralView: View {
    @ObservedObject var viewModel: GeneralViewModel

    var body: some View {
        VStack {
            Toggle(isOn: viewModel.launchAtLoginBinding) {
                Text("Start at login")
                    .font(.title3)
            }
            .toggleStyle(SwitchToggleStyle(tint: .cyan))
            .onChange(of: viewModel.launchAtLoginBinding.wrappedValue) { newValue in
                viewModel.updateLaucnAtLoginWith(newValue)
            }
        }
        .frame(width: 140, height: 30)
    }
}

#Preview {
    GeneralView(viewModel: .init())
}
