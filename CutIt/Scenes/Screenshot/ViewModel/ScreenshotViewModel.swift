import SwiftUI

final class ScreenshotViewModel: ObservableObject {
    @Published var images: [NSImage] = []

    // MARK: - TAKE SCREENSHOT

    func takeScreenshot(for type: ScreenshotTypes) {
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

    // MARK: - PATH TO SAVE SCREENSHOT

    func pathToSaveScreenshot() -> URL? {
        let configPanelToSave = NSSavePanel()
        configPanelToSave.allowedContentTypes = [.png]
        configPanelToSave.canCreateDirectories = true
        configPanelToSave.isExtensionHidden = false
        configPanelToSave.title = "Save your screenshot"
        configPanelToSave.nameFieldLabel = "File name: "

        let response = configPanelToSave.runModal()
        return response == .OK ? configPanelToSave.url : nil
    }

    // MARK: - SAVE SCREENSHOT

    func save(image: NSImage, path: URL?) {
        if let data = image.tiffRepresentation {
            let imageRepo = NSBitmapImageRep(data: data)
            let pngData = imageRepo?.representation(using: .png, properties: [:])
            do {
                if let currentPath = path {
                    try pngData!.write(to: currentPath)
                }
            } catch {
                print("An error has occurred with save screenshot! Error: \(error)")
            }
        }
    }

    // MARK: - ADD SCREENSHOT IN THE LIST

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
