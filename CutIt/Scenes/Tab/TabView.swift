import SwiftUI

struct TabView: View {
    @StateObject var viewModel = TabViewModel()

    var body: some View {
        HStack {
            VStack {
                ForEach(viewModel.tabs, id: \.self) { option in
                    TabButton(image: option.image, title: option.text)
                }

                Spacer()
            }
            .padding()
            .padding(.top, 36)
            .background(BlurView())

            Spacer()
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

#Preview {
    TabView(viewModel: .init())
}
