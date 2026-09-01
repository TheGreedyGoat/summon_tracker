import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_state.freezed.dart';

@freezed
/// gets updated, whenever the database changes
class ChangeState with _$ChangeState {
  final int master,
      variant,
      instance,
      abilityScore,
      variable,
      feature,
      skillProf,
      skill,
      damagemod,
      damageType;

  ChangeState({
    this.master = 0,
    this.variant = 0,
    this.instance = 0,
    this.abilityScore = 0,
    this.variable = 0,
    this.feature = 0,
    this.skillProf = 0,
    this.skill = 0,
    this.damagemod = 0,
    this.damageType = 0,
  });
}
