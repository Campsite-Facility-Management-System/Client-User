import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  lazy var flutterEngine = FlutterEngine(name: "MyApp")

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
       FirebaseApp.configure()
       flutterEngine.run()

        // Used to connect plugins (only if you have plugins with iOS platform code).
        GeneratedPluginRegistrant.register(with: self.flutterEngine)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
