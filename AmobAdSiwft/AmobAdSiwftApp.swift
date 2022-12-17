import UIKit
import SwiftUI
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    // Initialize Mobile Ads SDK
    GADMobileAds.sharedInstance().start(completionHandler: nil)

    return true
  }
}

@main
struct AmobAdSiwftApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
