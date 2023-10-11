//
//  cellArrayTestApp.swift
//  cellArrayTest
//
//  Created by John Welch on 10/5/23.
//

import SwiftUI
import Foundation

class AppDelegate: NSObject, NSApplicationDelegate {
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
			return true
	}

	func applicationWillTerminate(_ notification: Notification) {
		//this prevents the window size from being saved. we don't want that, it gets weird
		if let bundleID = Bundle.main.bundleIdentifier {
			UserDefaults.standard.removePersistentDomain(forName: bundleID)
		}
	}
}

@main
struct cellArrayTestApp: App {
	@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
