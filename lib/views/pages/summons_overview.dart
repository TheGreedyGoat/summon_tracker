import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/models/summon_template.dart';
import 'package:summon_tracker/views/widget_tree_notifier.dart';

class SummonsOverview extends ConsumerWidget {
  const SummonsOverview({super.key});

  List<SummonTemplate> get templates => SummonTemplate.templates.toList();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return templates.length > 0
        ? ListView.builder(
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final template = templates[index];
              return ListTile(
                title: Text(templates[index].name),
                subtitle: Text('summoned: ${template.instances.length}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        final notifier = ref.read(widgetTreeProvider.notifier);
                        notifier.setPage(notifier.templateEdit(template));
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.sparkles),
                    ),
                  ],
                ),
              );
            },
          )
        : Text('No templates saved yet');
  }
}
