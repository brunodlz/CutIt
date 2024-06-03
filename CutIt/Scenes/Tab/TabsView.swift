import SwiftUI

struct TabsView: View {
    @StateObject var tabViewModel: TabViewModel
    @StateObject var screenshotViewModel: ScreenshotViewModel

    var body: some View {
        HStack {
            VStack {
                ForEach(tabViewModel.tabs, id: \.self) { option in
                    TabButton(image: option.image,
                              title: option.text) {
                        capture(from: option)
                    }
                }

                Spacer()

                TabButton(image: "gear",
                          title: "Settings") {
                    
                }
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
    TabsView(tabViewModel: .init(),
            screenshotViewModel: .init())
}
