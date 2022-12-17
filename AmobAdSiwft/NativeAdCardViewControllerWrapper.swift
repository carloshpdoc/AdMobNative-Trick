import SwiftUI

struct NativeAdCardViewControllerWrapper : UIViewControllerRepresentable {

  func makeUIViewController(context: Context) -> UIViewController {
    let viewController = NativeAdCardViewController()
    return viewController
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}
