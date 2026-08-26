import 'dart:math';

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

  DamageType getDmgType([bool forceMagical = false]) =>
      DamageType(longName: long, isMagical: forceMagical || isMagical);

  final String long;
  final String short;
  const BaseDamageType({required this.long, required this.short});
}

class DamageType {
  final String longName;
  final bool isMagical;
  String get shortName => longName.substring(0, min(5, longName.length));
  DamageType({required this.longName, required this.isMagical});
  factory DamageType.core({
    required BaseDamageType type,
    bool forceM = false,
  }) => type.getDmgType(forceM);

  @override
  bool operator ==(Object other) =>
      other is DamageType &&
      other.longName == longName &&
      other.isMagical == isMagical;
  @override
  int get hashCode => Object.hash(longName, isMagical);
}

@freezed
class DamageModifier with _$DamageModifier {
  @override
  final DamageType damageType;
  @override
  final DamageMod damageMod;

  const DamageModifier({required this.damageType, required this.damageMod});
}
