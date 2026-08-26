import 'package:summon_tracker/services/database/data_base_tables.dart';
import 'package:uuid/uuid.dart';

class MyVariable {
  final String id;
  final String displayName;
  final String tag;
  final int value;

  MyVariable({
    String? id,
    required this.displayName,
    required this.tag,
    required this.value,
  }) : this.id = id ?? Uuid().v1();

  Map<String, dynamic> toJson() => {
    c_v_id: id,
    c_v_display_name: displayName,
    c_v_tag: tag,
    c_v_value: value,
  };
}
