// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summon_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SummonTemplate {

//General
 String get _id; String get name; NumericExpression get armorClass; NumericExpression get hitPoints; FreeText get speed; FreeText get senses; FreeText get languages; NumericExpression get proficiencyBonus; List<DamageModifier> get damageMods;// Ability Scores + Save profs
 AbilityScoreNum get strengthScore; AbilityScoreNum get dexterityScore; AbilityScoreNum get constitutionScore; AbilityScoreNum get intelligenceScore; AbilityScoreNum get wisdomScore; AbilityScoreNum get charismaScore;// skills
 List<SkillProficiency> get skillProficiencies;// Features
 List<ActionFeature> get featAbilities; List<ActionFeature> get actions; List<ActionFeature> get bonusActions; List<ActionFeature> get reactions; List<MyVariable> get templateVariables;
/// Create a copy of SummonTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummonTemplateCopyWith<SummonTemplate> get copyWith => _$SummonTemplateCopyWithImpl<SummonTemplate>(this as SummonTemplate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummonTemplate&&(identical(other._id, _id) || other._id == _id)&&(identical(other.name, name) || other.name == name)&&(identical(other.armorClass, armorClass) || other.armorClass == armorClass)&&(identical(other.hitPoints, hitPoints) || other.hitPoints == hitPoints)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.senses, senses) || other.senses == senses)&&(identical(other.languages, languages) || other.languages == languages)&&(identical(other.proficiencyBonus, proficiencyBonus) || other.proficiencyBonus == proficiencyBonus)&&const DeepCollectionEquality().equals(other.damageMods, damageMods)&&(identical(other.strengthScore, strengthScore) || other.strengthScore == strengthScore)&&(identical(other.dexterityScore, dexterityScore) || other.dexterityScore == dexterityScore)&&(identical(other.constitutionScore, constitutionScore) || other.constitutionScore == constitutionScore)&&(identical(other.intelligenceScore, intelligenceScore) || other.intelligenceScore == intelligenceScore)&&(identical(other.wisdomScore, wisdomScore) || other.wisdomScore == wisdomScore)&&(identical(other.charismaScore, charismaScore) || other.charismaScore == charismaScore)&&const DeepCollectionEquality().equals(other.skillProficiencies, skillProficiencies)&&const DeepCollectionEquality().equals(other.featAbilities, featAbilities)&&const DeepCollectionEquality().equals(other.actions, actions)&&const DeepCollectionEquality().equals(other.bonusActions, bonusActions)&&const DeepCollectionEquality().equals(other.reactions, reactions)&&const DeepCollectionEquality().equals(other.templateVariables, templateVariables));
}


@override
int get hashCode => Object.hashAll([runtimeType,_id,name,armorClass,hitPoints,speed,senses,languages,proficiencyBonus,const DeepCollectionEquality().hash(damageMods),strengthScore,dexterityScore,constitutionScore,intelligenceScore,wisdomScore,charismaScore,const DeepCollectionEquality().hash(skillProficiencies),const DeepCollectionEquality().hash(featAbilities),const DeepCollectionEquality().hash(actions),const DeepCollectionEquality().hash(bonusActions),const DeepCollectionEquality().hash(reactions),const DeepCollectionEquality().hash(templateVariables)]);

@override
String toString() {
  return 'SummonTemplate(_id: $_id, name: $name, armorClass: $armorClass, hitPoints: $hitPoints, speed: $speed, senses: $senses, languages: $languages, proficiencyBonus: $proficiencyBonus, damageMods: $damageMods, strengthScore: $strengthScore, dexterityScore: $dexterityScore, constitutionScore: $constitutionScore, intelligenceScore: $intelligenceScore, wisdomScore: $wisdomScore, charismaScore: $charismaScore, skillProficiencies: $skillProficiencies, featAbilities: $featAbilities, actions: $actions, bonusActions: $bonusActions, reactions: $reactions, templateVariables: $templateVariables)';
}


}

/// @nodoc
abstract mixin class $SummonTemplateCopyWith<$Res>  {
  factory $SummonTemplateCopyWith(SummonTemplate value, $Res Function(SummonTemplate) _then) = _$SummonTemplateCopyWithImpl;
@useResult
$Res call({
 String name, NumericExpression armorClass, NumericExpression hitPoints, FreeText speed, FreeText senses, FreeText languages, NumericExpression proficiencyBonus, List<DamageModifier> damageMods, AbilityScoreNum strengthScore, AbilityScoreNum dexterityScore, AbilityScoreNum constitutionScore, AbilityScoreNum intelligenceScore, AbilityScoreNum wisdomScore, AbilityScoreNum charismaScore, List<SkillProficiency> skillProficiencies, List<ActionFeature> featAbilities, List<ActionFeature> bonusActions, List<ActionFeature> reactions, List<MyVariable> templateVariables, List<ActionFeature> actions
});




}
/// @nodoc
class _$SummonTemplateCopyWithImpl<$Res>
    implements $SummonTemplateCopyWith<$Res> {
  _$SummonTemplateCopyWithImpl(this._self, this._then);

  final SummonTemplate _self;
  final $Res Function(SummonTemplate) _then;

/// Create a copy of SummonTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? armorClass = null,Object? hitPoints = null,Object? speed = null,Object? senses = null,Object? languages = null,Object? proficiencyBonus = null,Object? damageMods = null,Object? strengthScore = null,Object? dexterityScore = null,Object? constitutionScore = null,Object? intelligenceScore = null,Object? wisdomScore = null,Object? charismaScore = null,Object? skillProficiencies = null,Object? featAbilities = null,Object? bonusActions = null,Object? reactions = null,Object? templateVariables = null,Object? actions = null,}) {
  return _then(SummonTemplate(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,armorClass: null == armorClass ? _self.armorClass : armorClass // ignore: cast_nullable_to_non_nullable
as NumericExpression,hitPoints: null == hitPoints ? _self.hitPoints : hitPoints // ignore: cast_nullable_to_non_nullable
as NumericExpression,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as FreeText,senses: null == senses ? _self.senses : senses // ignore: cast_nullable_to_non_nullable
as FreeText,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as FreeText,proficiencyBonus: null == proficiencyBonus ? _self.proficiencyBonus : proficiencyBonus // ignore: cast_nullable_to_non_nullable
as NumericExpression,damageMods: null == damageMods ? _self.damageMods : damageMods // ignore: cast_nullable_to_non_nullable
as List<DamageModifier>,strengthScore: null == strengthScore ? _self.strengthScore : strengthScore // ignore: cast_nullable_to_non_nullable
as AbilityScoreNum,dexterityScore: null == dexterityScore ? _self.dexterityScore : dexterityScore // ignore: cast_nullable_to_non_nullable
as AbilityScoreNum,constitutionScore: null == constitutionScore ? _self.constitutionScore : constitutionScore // ignore: cast_nullable_to_non_nullable
as AbilityScoreNum,intelligenceScore: null == intelligenceScore ? _self.intelligenceScore : intelligenceScore // ignore: cast_nullable_to_non_nullable
as AbilityScoreNum,wisdomScore: null == wisdomScore ? _self.wisdomScore : wisdomScore // ignore: cast_nullable_to_non_nullable
as AbilityScoreNum,charismaScore: null == charismaScore ? _self.charismaScore : charismaScore // ignore: cast_nullable_to_non_nullable
as AbilityScoreNum,skillProficiencies: null == skillProficiencies ? _self.skillProficiencies : skillProficiencies // ignore: cast_nullable_to_non_nullable
as List<SkillProficiency>,featAbilities: null == featAbilities ? _self.featAbilities : featAbilities // ignore: cast_nullable_to_non_nullable
as List<ActionFeature>,bonusActions: null == bonusActions ? _self.bonusActions : bonusActions // ignore: cast_nullable_to_non_nullable
as List<ActionFeature>,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<ActionFeature>,templateVariables: null == templateVariables ? _self.templateVariables : templateVariables // ignore: cast_nullable_to_non_nullable
as List<MyVariable>,actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<ActionFeature>,
  ));
}

}


/// Adds pattern-matching-related methods to [SummonTemplate].
extension SummonTemplatePatterns on SummonTemplate {
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
