import Cocoa

class AutoLauncherAppDelegate: NSObject, NSApplicationDelegate {
    struct Constants {
        static let mainAppBundleID = "code.io.AutoLauncher"
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let runningsApps = NSWorkspace.shared.runningApplications
        let isRunning = runningsApps.contains {
            $0.bundleIdentifier == Constants.mainAppBundleID
        }

        if !isRunning {
            let appPath: String = {
                let path = Bundle.main.bundlePath as NSString
                var components = path.pathComponents
                components.removeLast(4)
                return NSString.path(withComponents: components)
            }()

            let appURL = URL(fileURLWithPath: appPath)
            NSWorkspace.shared.openApplication(at: appURL,
                                               configuration: NSWorkspace.OpenConfiguration(),
                                               completionHandler: nil)
        }
    }
}
