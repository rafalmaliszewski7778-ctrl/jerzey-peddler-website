import UIKit
import WebKit

/// Hosts the game (index.html, bundled offline) full-screen.
final class GameViewController: UIViewController, WKNavigationDelegate {
    private var webView: WKWebView!

    override func loadView() {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let wv = WKWebView(frame: .zero, configuration: config)
        wv.isOpaque = false
        wv.backgroundColor = UIColor(red: 0.78, green: 0.71, blue: 1.0, alpha: 1)
        wv.scrollView.isScrollEnabled = false
        wv.scrollView.bounces = false
        wv.scrollView.contentInsetAdjustmentBehavior = .never
        wv.allowsLinkPreview = false
        wv.navigationDelegate = self
        webView = wv
        view = wv
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGame()
    }

    private func loadGame() {
        guard let url = Bundle.main.url(forResource: "index", withExtension: "html") else { return }
        webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }

    // Reload if iOS kills the web process in the background.
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        loadGame()
    }

    // Never navigate anywhere outside the bundled game.
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(navigationAction.request.url?.isFileURL == true ? .allow : .cancel)
    }

    override var prefersStatusBarHidden: Bool { true }
    override var prefersHomeIndicatorAutoHidden: Bool { true }
    // Edge swipes need a second swipe, so a toddler can't easily leave the app.
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge { .all }
}
