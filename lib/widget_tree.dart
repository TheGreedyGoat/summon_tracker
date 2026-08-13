import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/notifiers/fab_notifier.dart';
import 'package:summon_tracker/views/pages/template_edit/template_edit_page_view.dart';

class WidgetTree extends ConsumerWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fabState = ref.watch(fabProvider);
    return Scaffold(
      body: SafeArea(child: TemplateEditPageView()),
      floatingActionButton: Builder(
        builder: (context) {
          var current = fabState;
          final states = List<FloatingActionButton>.empty(growable: true);
          while (current != null) {
            print('umm');
            states.add(
              FloatingActionButton(
                mini: true,
                onPressed: current.onPressed,
                child: Icon(current.icon),
              ),
            );
            current = current.child;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: states,
          );
        },
      ),
    );
  }
}
