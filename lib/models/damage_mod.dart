import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/models/ability.dart';
import 'package:summon_tracker/models/numeric_expression.dart';

part 'damage_mod.freezed.dart';

enum DamageMod {
  none(1),
  vulnerable(2),
  resistant(0.5),
  immune(0);

  final double multiplier;
  String get long => '${name[0].toUpperCase()}${name.substring(1)}';
  String get short => long.substring(0, 4);
  int calcDamage(int damage) => (damage * multiplier).floor();
  const DamageMod(this.multiplier);
}

enum BaseDamageType {
  bludgeoning(long: 'Bludgeoning', short: 'Blud'),
  piercing(long: 'Piercing', short: 'Pier'),
  slashing(long: 'Slashing', short: 'Slash'),
  acid(long: 'Acid', short: 'Acid'),
  cold(long: 'Cold', short: 'Cold'),
  fire(long: 'Fire', short: 'Fire'),
  force(long: 'Force', short: 'Force'),
  lightning(long: 'Lightning', short: 'Light'),
  necrotic(long: 'Necrotic', short: 'Nec'),
  poison(long: 'Poison', short: 'Poison'),
  psychic(long: 'Psychic', short: 'Psych'),
  radiant(long: 'Radiant', short: 'Rad'),
  thunder(long: 'Thunder', short: 'Thund');

  bool get isMagical =>
      this != bludgeoning && this != piercing && this != slashing;

  final String long;
  final String short;
  const BaseDamageType({required this.long, required this.short});
}

@freezed
class DamageModifier with _$DamageModifier {
  final String damageType;
  final DamageMod damageMod;

  const DamageModifier({required this.damageType, required this.damageMod});
}
