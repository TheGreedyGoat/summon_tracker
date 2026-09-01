import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summon_tracker/logic/models/summons/summon_master.dart';
import 'package:summon_tracker/logic/notifiers/change_notifier.dart';
import 'package:summon_tracker/logic/services/database/database_service.dart';
import 'package:summon_tracker/views/dialogs/choose_variant_dialog.dart';
import 'package:summon_tracker/views/dialogs/confirm_master_deletion_dialog.dart';
import 'package:summon_tracker/views/pages/instance_vars_page.dart';

class SummonMasterTile extends ConsumerStatefulWidget {
  final String masterID;
  const SummonMasterTile({required this.masterID, super.key});

  @override
  ConsumerState<SummonMasterTile> createState() => _SummonMasterTileState();
}

class _SummonMasterTileState extends ConsumerState<SummonMasterTile> {
  Future<SummonMaster> get mFuture async =>
      (await DatabaseService.instance.getSummonMaster(widget.masterID))!;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final master = snapshot.requireData;

          return ExpansionTile(
            title: Text(master.name),
            subtitle: Text('Variants: ${master.variants.length}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => summon(master),
                  tooltip: 'summon',
                  icon: Icon(Icons.star),
                ),
                PopupMenuButton(
                  itemBuilder: (context) {
                    return _menu(master, context);
                  },
                ),
              ],
            ),
            children: master.variants
                .map(
                  (variant) => ListTile(
                    title: Text(variant.name),
                  ),
                )
                .toList(),
          );
        } else {
          return Text('Error');
        }
      },
    );
  }

  List<PopupMenuItem> _menu(SummonMaster master, BuildContext context) => [
    PopupMenuItem(
      child: Row(
        children: [
          Icon(
            Icons.edit,
          ),
          Text('edit'),
        ],
      ),
    ),
    PopupMenuItem(
      child: Row(
        children: [
          Icon(
            Icons.add,
          ),
          Text('add variant'),
        ],
      ),
    ),
    PopupMenuItem(
      onTap: () => DatabaseService.instance
          .deleteSummonMaster(
            master.id,
            confirmationCallback: () async =>
                await confirmMasterCreationDialog(master, context),
          )
          .then(
            (v) {
              if (v) {
                ref.read(refChanges.notifier).masterChanged();
              }
            },
          ),
      child: Row(
        children: [
          Icon(
            Icons.delete,
          ),
          Text('delete'),
        ],
      ),
    ),
  ];

  Future<void> summon(SummonMaster master) async {
    int index = await chooseVariantDialog(master.variants, context);
    final variant = master.variants[index];
    bool proceed = true;
    if (variant.instanceVariables.isNotEmpty) {
      proceed =
          (await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InstanceVarsPage(variant: variant);
              },
            ),
          )) ??
          false;
    }
    if (!proceed) return;
  }
}
