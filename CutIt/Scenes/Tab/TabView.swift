import SwiftUI

struct TabView: View {
    @StateObject var tabViewModel: TabViewModel
    @StateObject var screenshotViewModel: ScreenshotViewModel

    var body: some View {
        HStack {
            VStack {
                ForEach(tabViewModel.tabs, id: \.self) { option in
                    TabButton(image: option.image, title: option.text) {
                        capture(from: option)
                    }
                }
                Spacer()
            }
            .padding()
            .padding(.top, 18)

            ZStack {
                ScreenshotView(viewModel: screenshotViewModel)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
        }
    }

    private func capture(from option: TabOption) {
        switch option {
            case .window:
                screenshotViewModel.takeScreenshot(for: .window)
            case .full:
                screenshotViewModel.takeScreenshot(for: .full)
            case .area:
                screenshotViewModel.takeScreenshot(for: .area)
        }
    }
}

#Preview {
    TabView(tabViewModel: .init(),
            screenshotViewModel: .init())
}
