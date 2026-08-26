import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/notifiers/fab_notifier.dart';
import 'package:summon_tracker/notifiers/widget_tree_state.dart';
import 'package:summon_tracker/views/pages/template_overview.dart';

class WidgetTree extends ConsumerWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wtState = ref.watch(wtProvider);
    return Scaffold(
      body: SafeArea(child: wtState.body),
      floatingActionButton: wtState.floatingActionbutton,
    );
  }
}
