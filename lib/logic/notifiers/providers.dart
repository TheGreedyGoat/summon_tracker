import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summon_tracker/logic/models/summons/summon_master.dart';
import 'package:summon_tracker/logic/notifiers/change_notifier.dart';
import 'package:summon_tracker/logic/services/database/database_service.dart';

final FutureProvider<List<SummonMaster>> refMasters = FutureProvider(
  (ref) async {
    ref.watch(
      refChanges.select(
        (value) => value.master,
      ),
    );
    return await DatabaseService.instance.summonMasters;
  },
);
