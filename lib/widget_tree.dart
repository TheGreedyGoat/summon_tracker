import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/views/pages/summons_overview.dart';
import 'package:summon_tracker/views/widget_tree_notifier.dart';
import 'package:summon_tracker/views/widget_tree_state.dart';

class WidgetTree extends ConsumerWidget {
  const WidgetTree({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WidgetTreeState state = ref.watch(widgetTreeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(state.title ?? ''),
      ),
      body: Center(child: state.body),
      floatingActionButton: state.floatingActionButton,
    );
  }
}
