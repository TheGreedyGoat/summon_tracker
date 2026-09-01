import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/views/dialogs/create_master_dialog.dart';
import 'package:summon_tracker/views/pages/template_overview.dart';
import 'package:summon_tracker/views/theming/colors.dart';

class WidgetTree extends ConsumerWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyScaffold(
      body: TemplateOverview(),
      fab: FloatingActionButton(
        onPressed: () {
          showMasterCreationDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? appBarTitle;
  final Widget body;
  final Widget? fab;
  const MyScaffold({
    super.key,
    this.appBar,
    this.appBarTitle,
    required this.body,
    this.fab,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar ??
          AppBar(
            title: appBarTitle ?? Text('Summon Manager'),
            backgroundColor: appbarColor,
          ),
      body: body,
      floatingActionButton: fab,
    );
  }
}
