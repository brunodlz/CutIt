import SwiftUI

final class TabViewModel: ObservableObject {
    let tabs: [TabOption] = [.window, .full, .area]
}
