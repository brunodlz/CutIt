import SwiftUI

final class ScreenCaptureViewModel: ObservableObject {
    @Published var images: [NSImage] = []

    func takeScreenshot(for type: ScreenCaptureTypes) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        task.arguments = type.processArguments

        do {
            try task.run()
            task.waitUntilExit()

            getImageFromPasterboard()

        } catch {
            print("Could not take a screenshot!!! Error: \(error)")
        }
    }

    private func getImageFromPasterboard() {
        guard NSPasteboard.general.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else {
            return
        }

        guard let screenshot = NSImage(pasteboard: NSPasteboard.general) else {
            return
        }

        images.append(screenshot)
    }
}
