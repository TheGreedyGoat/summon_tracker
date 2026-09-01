import 'package:flutter/material.dart';
import 'package:summon_tracker/logic/models/summons/summon_master.dart';
import 'package:summon_tracker/views/widgets/separator_title.dart';

Future<bool> confirmMasterCreationDialog(
  SummonMaster master,
  BuildContext context,
) async {
  return (await showDialog<bool>(
        context: context,
        builder: (context) => Dialog(
          child: _ConfirmMasterDeletionDialog(master: master),
        ),
      )) ??
      false;
}

class _ConfirmMasterDeletionDialog extends StatefulWidget {
  final SummonMaster master;
  const _ConfirmMasterDeletionDialog({super.key, required this.master});

  @override
  State<_ConfirmMasterDeletionDialog> createState() =>
      _ConfirmMasterDeletionDialogState();
}

class _ConfirmMasterDeletionDialogState
    extends State<_ConfirmMasterDeletionDialog> {
  SummonMaster get master => widget.master;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SeparatorTitle(title: 'confirm deletion'),
          Text('Are you sure you wanne delete ${master.name}?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text('cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
