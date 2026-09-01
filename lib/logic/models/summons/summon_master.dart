import 'package:summon_tracker/logic/models/summons/summon_variant.dart';

class SummonMaster {
  final String id;
  final List<SummonVariant> variants;
  final String name;

  SummonMaster({required this.id, required this.variants, required this.name});
}
