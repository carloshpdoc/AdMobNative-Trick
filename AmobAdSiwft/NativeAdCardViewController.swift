
import UIKit
import GoogleMobileAds

class NativeAdCardViewController: UIViewController {

    var heightConstraint: NSLayoutConstraint?

    var adLoader: GADAdLoader!

    var nativeAdView: GADNativeAdView!

    let adUnitID = "ca-app-pub-3940256099942544/3986624511"

    override func viewDidLoad() {
        super.viewDidLoad()

        print("==> 0")
        guard
            let nibObjects = Bundle.main.loadNibNamed("NativeAdView", owner: nil, options: nil),
            let adView = nibObjects.first as? GADNativeAdView
        else {
            print("==> 0000")
            assert(false, "Could not load nib file for adView")
        }
        print("==> 1")
        setAdView(adView)
        refreshAd()
    }

    func setAdView(_ view: GADNativeAdView) {
        print("==> 2")
        nativeAdView = view
        self.view.addSubview(nativeAdView)
        print("==> 3")
        nativeAdView.translatesAutoresizingMaskIntoConstraints = false

        nativeAdView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        nativeAdView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        nativeAdView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        nativeAdView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
    }

    // MARK: - Actions
    func refreshAd() {
        print("==> 4")
        adLoader = GADAdLoader(
            adUnitID: adUnitID, rootViewController: self,
            adTypes: [.native], options: nil)
        adLoader.delegate = self
        adLoader.load(GADRequest())
        print("==> 5")
    }
}

extension NativeAdCardViewController: GADNativeAdLoaderDelegate {

    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        print("==> 6")
        nativeAd.delegate = self

        heightConstraint?.isActive = false
        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
        (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
//        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

        if let mediaView = nativeAdView.mediaView, nativeAd.mediaContent.aspectRatio > 0 {
            heightConstraint = NSLayoutConstraint(
                item: mediaView,
                attribute: .height,
                relatedBy: .equal,
                toItem: mediaView,
                attribute: .width,
                multiplier: CGFloat(1 / nativeAd.mediaContent.aspectRatio),
                constant: 0)
            heightConstraint?.isActive = true
        }

        nativeAdView.nativeAd = nativeAd
    }

    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        print(" ==> \(adLoader) failed with error: \(error.localizedDescription)")
    }
}

// MARK: - GADNativeAdDelegate implementation

extension NativeAdCardViewController: GADNativeAdDelegate {

    func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
        print("==>\(#function) called")
    }

    func nativeAdDidRecordImpression(_ nativeAd: GADNativeAd) {
        print("==> \(#function) called")
        print("==> 7")
        nativeAd.delegate = self

        heightConstraint?.isActive = false
        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
        (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
//        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

        if let mediaView = nativeAdView.mediaView, nativeAd.mediaContent.aspectRatio > 0 {
            heightConstraint = NSLayoutConstraint(
                item: mediaView,
                attribute: .height,
                relatedBy: .equal,
                toItem: mediaView,
                attribute: .width,
                multiplier: CGFloat(1 / nativeAd.mediaContent.aspectRatio),
                constant: 0)
            heightConstraint?.isActive = true
        }

        nativeAdView.nativeAd = nativeAd
    }

    func nativeAdWillPresentScreen(_ nativeAd: GADNativeAd) {
        print("==> \(#function) called")
    }

    func nativeAdWillDismissScreen(_ nativeAd: GADNativeAd) {
        print("==> \(#function) called")
    }

    func nativeAdDidDismissScreen(_ nativeAd: GADNativeAd) {
        print("==> \(#function) called")
    }

    func nativeAdIsMuted(_ nativeAd: GADNativeAd) {
        print("==> \(#function) called")
    }
}
