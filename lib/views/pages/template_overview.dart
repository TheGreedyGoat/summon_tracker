import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:summon_tracker/logic/notifiers/providers.dart';
import 'package:summon_tracker/views/dialogs/create_master_dialog.dart';
import 'package:summon_tracker/views/pages/summon_master_tile.dart';

/// The app's main page.
///
/// From here the user can overview, summon and manage their created templates, edit them or create new ones.
///
///
class TemplateOverview extends ConsumerStatefulWidget {
  /// The app's main page.
  ///
  /// From here the user can overview, summon and manage their created templates, edit them or create new ones.
  ///
  ///
  const TemplateOverview({super.key});

  @override
  ConsumerState<TemplateOverview> createState() => _TemplateOverviewState();
}

class _TemplateOverviewState extends ConsumerState<TemplateOverview> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.watch(refMasters.future),
      builder: (context, builder) {
        if (builder.hasData) {
          final masters = builder.requireData;
          return ListView.builder(
            itemCount: max(masters.length, 1),
            itemBuilder: (context, index) {
              if (masters.isNotEmpty) {
                return SummonMasterTile(masterID: masters[index].id);
              } else {
                return ListTile(
                  title: Text('No summons yet'),
                );
              }
            },
          );
        }
        if (builder.hasError) {
          return Text(builder.error.toString());
        }
        return Placeholder();
      },
    );
  }

  Future<void> addMaster(BuildContext context) async {
    await showMasterCreationDialog(context);
  }
}
