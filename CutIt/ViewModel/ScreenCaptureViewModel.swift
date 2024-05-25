import SwiftUI

final class ScreenCaptureViewModel: ObservableObject {

    func takeScreenshot(for type: ScreenCaptureTypes) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        task.arguments = type.processArguments

        do {
            try task.run()
            task.waitUntilExit()

            print("Success!!!")

        } catch {
            print("Could not take a screenshot!!! Error: \(error)")
        }
    }
}
