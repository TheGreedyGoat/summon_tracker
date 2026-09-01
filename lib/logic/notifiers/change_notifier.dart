import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summon_tracker/logic/notifiers/change_state.dart';

final refChanges = NotifierProvider(
  () => ChangeNotifier(),
);

class ChangeNotifier extends Notifier<ChangeState> {
  @override
  ChangeState build() => ChangeState();

  void masterChanged() {
    state = state.copyWith(master: state.master + 1);
  }

  void variantChanged() {
    state = state.copyWith(variant: state.variant + 1);
  }

  void instanceChanged() {
    state = state.copyWith(instance: state.instance + 1);
  }

  void abilityScoreChanged() {
    state = state.copyWith(abilityScore: state.abilityScore + 1);
  }

  void variableChanged() {
    state = state.copyWith(variable: state.variable + 1);
  }

  void featureChanged() {
    state = state.copyWith(feature: state.feature + 1);
  }

  void skillProfChanged() {
    state = state.copyWith(skillProf: state.skillProf + 1);
  }

  void skillChanged() {
    state = state.copyWith(skill: state.skill + 1);
  }

  void damageModChanged() {
    state = state.copyWith(damagemod: state.damagemod + 1);
  }

  void damageTypeChanged() {
    state = state.copyWith(damageType: state.damageType + 1);
  }
}
