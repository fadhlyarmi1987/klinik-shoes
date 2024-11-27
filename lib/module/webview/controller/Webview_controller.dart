import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageController {
  late final WebViewController webViewController;

  WebViewPageController(String url) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  WebViewController get controller => webViewController;
}
