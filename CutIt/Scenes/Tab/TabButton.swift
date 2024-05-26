import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    var completion: (() -> Void)?

    var body: some View {
        Button {
            withAnimation {
                completion?()
            }
        } label: {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .font(.system(size: 16,
                                  weight: .semibold))

                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 12))
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical, 8)
            .frame(width: 85, height: 85)
            .background(Color.primary.opacity(0.16))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    TabButton(image: "macwindow.badge.plus",
              title: "Window Sreenshot") { }
}
