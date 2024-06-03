import SwiftUI
import ServiceManagement

final class GeneralViewModel: ObservableObject {
    private struct Constants {
        static let bundleID = "code.io.AutoLauncher"
    }

    @AppStorage("launchAtLogin") private var launchAtLogin = false

    // MARK: - Bindings

    var launchAtLoginBinding: Binding<Bool> {
        Binding { self.launchAtLogin } set: { value in self.launchAtLogin = value }
    }

    // MARK: - Public Methods

    func updateLaucnAtLoginWith(_ status: Bool) {
        if status {
            register()
        } else {
            unregister()
        }
    }

    // MARK: - Privates Methods

    private func register() {
        do {
            if #available(macOS 13.0, *) {
                try SMAppService.mainApp.register()
            } else {
                SMLoginItemSetEnabled(Constants.bundleID as CFString, true)
            }
        } catch {
            print("~> An error has occurred in register! Launch at login: \(error)")
        }
    }

    private func unregister() {
        do {
            if #available(macOS 13.0, *) {
                try SMAppService.mainApp.unregister()
            } else {
                SMLoginItemSetEnabled(Constants.bundleID as CFString, false)
            }
        } catch {
            print("~> An error has occurred in unregister! Launch at login: \(error)")
        }
    }
}
