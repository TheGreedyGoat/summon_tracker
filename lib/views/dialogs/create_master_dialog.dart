import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/logic/models/summons/summon_master.dart';
import 'package:summon_tracker/logic/notifiers/edit_variant_notifier.dart';
import 'package:summon_tracker/logic/services/database/database_service.dart';
import 'package:summon_tracker/views/pages/variant_edit/variant_edit_page_view.dart';
import 'package:summon_tracker/views/widgets/separator_title.dart';
import 'package:summon_tracker/views/widgets/template_editing/my_text_field.dart';
import 'package:summon_tracker/widget_tree.dart';
import 'package:uuid/uuid.dart';

Future<void> showMasterCreationDialog(BuildContext context) async {
  await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => Dialog(
      child: _CreateMasterDialog(),
    ),
  );
}

class _CreateMasterDialog extends ConsumerStatefulWidget {
  const _CreateMasterDialog({super.key});

  @override
  ConsumerState<_CreateMasterDialog> createState() =>
      _CreateMasterDialogState();
}

class _CreateMasterDialogState extends ConsumerState<_CreateMasterDialog> {
  String enteredName = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          SeparatorTitle(title: 'Namen eingeben'),
          MyTextField(
            label: 'Name',
            autofocus: true,
            onChanged: (value) => enteredName = value?.trim() ?? '',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  proceed(enteredName);
                },
                child: Text('confirm'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void proceed(String name) {
    if (name.isEmpty || !context.mounted) return;
    final master = SummonMaster(
      id: Uuid().v1(),
      variants: [],
      name: enteredName,
    );

    ref.read(editVariantProvider.notifier).setFromMaster(master: master);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MyScaffold(
            body: VariantEditPageView(
              master: master,
            ),
          );
        },
      ),
    );
  }
}
