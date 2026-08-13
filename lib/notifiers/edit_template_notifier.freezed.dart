// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_template_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditTemplateState {

 String get name; String get armorClass; String get hitPoints; String get speed; String get senses; String get languages; String get proficiencyBonus; List<DamageModifier> get damageMods;// Ability Scores + Save profs
 List<AbilityScoreString> get abilityScores;// skills
 List<SkillProficiency> get skillProficiencies;// Free Texts
 List<ActionAbility> get featureAbilities; List<ActionAbility> get actions; List<ActionAbility> get bonusActions; List<ActionAbility> get reactions;
/// Create a copy of EditTemplateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditTemplateStateCopyWith<EditTemplateState> get copyWith => _$EditTemplateStateCopyWithImpl<EditTemplateState>(this as EditTemplateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditTemplateState&&(identical(other.name, name) || other.name == name)&&(identical(other.armorClass, armorClass) || other.armorClass == armorClass)&&(identical(other.hitPoints, hitPoints) || other.hitPoints == hitPoints)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.senses, senses) || other.senses == senses)&&(identical(other.languages, languages) || other.languages == languages)&&(identical(other.proficiencyBonus, proficiencyBonus) || other.proficiencyBonus == proficiencyBonus)&&const DeepCollectionEquality().equals(other.damageMods, damageMods)&&const DeepCollectionEquality().equals(other.abilityScores, abilityScores)&&const DeepCollectionEquality().equals(other.skillProficiencies, skillProficiencies)&&const DeepCollectionEquality().equals(other.featureAbilities, featureAbilities)&&const DeepCollectionEquality().equals(other.actions, actions)&&const DeepCollectionEquality().equals(other.bonusActions, bonusActions)&&const DeepCollectionEquality().equals(other.reactions, reactions));
}


@override
int get hashCode => Object.hash(runtimeType,name,armorClass,hitPoints,speed,senses,languages,proficiencyBonus,const DeepCollectionEquality().hash(damageMods),const DeepCollectionEquality().hash(abilityScores),const DeepCollectionEquality().hash(skillProficiencies),const DeepCollectionEquality().hash(featureAbilities),const DeepCollectionEquality().hash(actions),const DeepCollectionEquality().hash(bonusActions),const DeepCollectionEquality().hash(reactions));

@override
String toString() {
  return 'EditTemplateState(name: $name, armorClass: $armorClass, hitPoints: $hitPoints, speed: $speed, senses: $senses, languages: $languages, proficiencyBonus: $proficiencyBonus, damageMods: $damageMods, abilityScores: $abilityScores, skillProficiencies: $skillProficiencies, featureAbilities: $featureAbilities, actions: $actions, bonusActions: $bonusActions, reactions: $reactions)';
}


}

/// @nodoc
abstract mixin class $EditTemplateStateCopyWith<$Res>  {
  factory $EditTemplateStateCopyWith(EditTemplateState value, $Res Function(EditTemplateState) _then) = _$EditTemplateStateCopyWithImpl;
@useResult
$Res call({
 String name, String armorClass, String hitPoints, String speed, String senses, String languages, String proficiencyBonus, List<DamageModifier> damageMods, List<AbilityScoreString> abilityScores, List<SkillProficiency> skillProficiencies, List<ActionAbility> featureAbilities, List<ActionAbility> actions, List<ActionAbility> bonusActions, List<ActionAbility> reactions
});




}
/// @nodoc
class _$EditTemplateStateCopyWithImpl<$Res>
    implements $EditTemplateStateCopyWith<$Res> {
  _$EditTemplateStateCopyWithImpl(this._self, this._then);

  final EditTemplateState _self;
  final $Res Function(EditTemplateState) _then;

/// Create a copy of EditTemplateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? armorClass = null,Object? hitPoints = null,Object? speed = null,Object? senses = null,Object? languages = null,Object? proficiencyBonus = null,Object? damageMods = null,Object? abilityScores = null,Object? skillProficiencies = null,Object? featureAbilities = null,Object? actions = null,Object? bonusActions = null,Object? reactions = null,}) {
  return _then(EditTemplateState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,armorClass: null == armorClass ? _self.armorClass : armorClass // ignore: cast_nullable_to_non_nullable
as String,hitPoints: null == hitPoints ? _self.hitPoints : hitPoints // ignore: cast_nullable_to_non_nullable
as String,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as String,senses: null == senses ? _self.senses : senses // ignore: cast_nullable_to_non_nullable
as String,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as String,proficiencyBonus: null == proficiencyBonus ? _self.proficiencyBonus : proficiencyBonus // ignore: cast_nullable_to_non_nullable
as String,damageMods: null == damageMods ? _self.damageMods : damageMods // ignore: cast_nullable_to_non_nullable
as List<DamageModifier>,abilityScores: null == abilityScores ? _self.abilityScores : abilityScores // ignore: cast_nullable_to_non_nullable
as List<AbilityScoreString>,skillProficiencies: null == skillProficiencies ? _self.skillProficiencies : skillProficiencies // ignore: cast_nullable_to_non_nullable
as List<SkillProficiency>,featureAbilities: null == featureAbilities ? _self.featureAbilities : featureAbilities // ignore: cast_nullable_to_non_nullable
as List<ActionAbility>,actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<ActionAbility>,bonusActions: null == bonusActions ? _self.bonusActions : bonusActions // ignore: cast_nullable_to_non_nullable
as List<ActionAbility>,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<ActionAbility>,
  ));
}

}


/// Adds pattern-matching-related methods to [EditTemplateState].
extension EditTemplateStatePatterns on EditTemplateState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
