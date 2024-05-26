import SwiftUI

final class TabViewModel: ObservableObject {
    @Published var selectedTab: TabOption = .window

    let tabs: [TabOption] = [.window, .full, .area]
}
