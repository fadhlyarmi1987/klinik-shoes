import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controller/Webview_controller.dart'; // Import the controller

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({required this.url}); // URL passed dynamically

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewPageController _webViewPageController;

  @override
  void initState() {
    super.initState();
    _webViewPageController = WebViewPageController(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Instagram'),
        backgroundColor: const Color(0xFF29D6C8),
      ),
      body: WebViewWidget(controller: _webViewPageController.controller),
    );
  }
}
