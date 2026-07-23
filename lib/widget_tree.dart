import 'package:flutter/material.dart';

class WidgetTree extends StatelessWidget {
  final Widget? appBarTitle;
  final Widget? body;
  final Widget? floatingActionButton;
  const WidgetTree({
    super.key,
    this.appBarTitle,
    this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarTitle),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
