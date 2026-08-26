import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:summon_tracker/services/database/database_service.dart';

/// The app's main page.
///
/// From here the user can overview, summon and manage their created templates, edit them or create new ones.
///
///
class TemplateOverview extends StatelessWidget {
  /// The app's main page.
  ///
  /// From here the user can overview, summon and manage their created templates, edit them or create new ones.
  ///
  ///
  const TemplateOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseService.instance.templates,
      builder: (context, builder) {
        if (builder.hasData) {
          final templates = builder.requireData;
          return ListView.builder(
            itemCount: max(templates.length, 1),
            itemBuilder: (context, index) {
              if (templates.isNotEmpty) {
                final tmpl = templates[index];
                return ListTile(
                  title: Text(tmpl.coreMap.toString()),
                  subtitle: Text('(summoncount)'),
                );
              } else {
                return ListTile(
                  title: Text('No summons yet'),
                  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                );
              }
            },
          );
        }
        if (builder.hasError) {
          return Text('');
        }
        return Placeholder();
      },
    );
  }
}
