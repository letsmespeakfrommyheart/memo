// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudyCardModel _$StudyCardModelFromJson(Map<String, dynamic> json) {
  return _StudyCardModel.fromJson(json);
}

/// @nodoc
mixin _$StudyCardModel {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  /// Serializes this StudyCardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudyCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudyCardModelCopyWith<StudyCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudyCardModelCopyWith<$Res> {
  factory $StudyCardModelCopyWith(
          StudyCardModel value, $Res Function(StudyCardModel) then) =
      _$StudyCardModelCopyWithImpl<$Res, StudyCardModel>;
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class _$StudyCardModelCopyWithImpl<$Res, $Val extends StudyCardModel>
    implements $StudyCardModelCopyWith<$Res> {
  _$StudyCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudyCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudyCardModelImplCopyWith<$Res>
    implements $StudyCardModelCopyWith<$Res> {
  factory _$$StudyCardModelImplCopyWith(_$StudyCardModelImpl value,
          $Res Function(_$StudyCardModelImpl) then) =
      __$$StudyCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class __$$StudyCardModelImplCopyWithImpl<$Res>
    extends _$StudyCardModelCopyWithImpl<$Res, _$StudyCardModelImpl>
    implements _$$StudyCardModelImplCopyWith<$Res> {
  __$$StudyCardModelImplCopyWithImpl(
      _$StudyCardModelImpl _value, $Res Function(_$StudyCardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudyCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$StudyCardModelImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudyCardModelImpl implements _StudyCardModel {
  const _$StudyCardModelImpl({required this.question, required this.answer});

  factory _$StudyCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudyCardModelImplFromJson(json);

  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'StudyCardModel(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudyCardModelImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  /// Create a copy of StudyCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudyCardModelImplCopyWith<_$StudyCardModelImpl> get copyWith =>
      __$$StudyCardModelImplCopyWithImpl<_$StudyCardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudyCardModelImplToJson(
      this,
    );
  }
}

abstract class _StudyCardModel implements StudyCardModel {
  const factory _StudyCardModel(
      {required final String question,
      required final String answer}) = _$StudyCardModelImpl;

  factory _StudyCardModel.fromJson(Map<String, dynamic> json) =
      _$StudyCardModelImpl.fromJson;

  @override
  String get question;
  @override
  String get answer;

  /// Create a copy of StudyCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudyCardModelImplCopyWith<_$StudyCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
