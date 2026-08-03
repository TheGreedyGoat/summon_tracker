import 'package:summon_tracker/models/stat_expression.dart';
import 'package:summon_tracker/models/summon_instance.dart';
import 'package:summon_tracker/models/summon_template.dart';

final List<SummonTemplate> savedSummons = [];

/// {summ0nID : instance}
final Map<String, List<SummonInstance>> instances = {};
