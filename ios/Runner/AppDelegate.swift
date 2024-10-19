import UIKit
import Flutter
import YandexMapsMobile

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // YMKMapKit.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
    guard let infoDictionary: [String: Any] = Bundle.main.infoDictionary else { return }
    guard let mapKitApiKey: String = infoDictionary["MapKitApiKey"] as? String else { return }
    print("Here's your mapKitApiKey value -> \(mapKitApiKey)")
    YMKMapKit.setApiKey(mapKitApiKey) // Your generated API key
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}