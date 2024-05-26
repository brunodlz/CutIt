import SwiftUI

struct TabView: View {
    @StateObject var tabViewModel: TabViewModel
    @StateObject var screenshotViewModel: ScreenshotViewModel

    var body: some View {
        HStack {
            VStack {
                ForEach(tabViewModel.tabs, id: \.self) { option in
                    TabButton(image: option.image, title: option.text) {
                        tabViewModel.selectedTab = option

                        // FIXME: Temporary
                        screenshotViewModel.takeScreenshot(for: .area)
                    }
                }

                Spacer()
            }
            .padding()
            .padding(.top, 36)
            .background(BlurView())

            ZStack {
                ScreenshotView(viewModel: screenshotViewModel)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
        }
        .ignoresSafeArea(.all, edges: .all)
    }

    @ViewBuilder
    private func capture(from option: TabOption) -> some View {
        switch option {
            case .window:
                ScreenshotView(viewModel: .init())
            case .full:
                ScreenshotView(viewModel: .init())
            case .area:
                ScreenshotView(viewModel: .init())
        }
    }
}

#Preview {
    TabView(tabViewModel: .init(),
            screenshotViewModel: .init())
}
