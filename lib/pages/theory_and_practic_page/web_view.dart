import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/services/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../models/theory_and_practic_model.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors();
    final NameLinkItem data =
        ModalRoute.of(context)!.settings.arguments as NameLinkItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        backgroundColor: appColors.mainAppColor,
        actions: [
          Icon(
            Icons.chevron_left,
            size: MediaQuery.of(context).size.width / 15,
          ),
          Icon(
            Icons.chevron_right,
            size: MediaQuery.of(context).size.width / 15,
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          Icon(
            Icons.replay_outlined,
            size: MediaQuery.of(context).size.width / 15,
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 20)
        ],
      ),
      backgroundColor: appColors.mainAppBackgroundColor,
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(data.link)),
      ),
    );
  }
}
