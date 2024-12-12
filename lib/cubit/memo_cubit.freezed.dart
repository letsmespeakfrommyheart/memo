// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemoCubitState {
  List<dynamic> get listOfWords => throw _privateConstructorUsedError;
  Filter get filter => throw _privateConstructorUsedError;
  List<int> get filteredKeys => throw _privateConstructorUsedError;
  List<StudyCardModel> get questions => throw _privateConstructorUsedError;

  /// Create a copy of MemoCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoCubitStateCopyWith<MemoCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCubitStateCopyWith<$Res> {
  factory $MemoCubitStateCopyWith(
          MemoCubitState value, $Res Function(MemoCubitState) then) =
      _$MemoCubitStateCopyWithImpl<$Res, MemoCubitState>;
  @useResult
  $Res call(
      {List<dynamic> listOfWords,
      Filter filter,
      List<int> filteredKeys,
      List<StudyCardModel> questions});
}

/// @nodoc
class _$MemoCubitStateCopyWithImpl<$Res, $Val extends MemoCubitState>
    implements $MemoCubitStateCopyWith<$Res> {
  _$MemoCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfWords = null,
    Object? filter = null,
    Object? filteredKeys = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      listOfWords: null == listOfWords
          ? _value.listOfWords
          : listOfWords // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
      filteredKeys: null == filteredKeys
          ? _value.filteredKeys
          : filteredKeys // ignore: cast_nullable_to_non_nullable
              as List<int>,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<StudyCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoCubitStateImplCopyWith<$Res>
    implements $MemoCubitStateCopyWith<$Res> {
  factory _$$MemoCubitStateImplCopyWith(_$MemoCubitStateImpl value,
          $Res Function(_$MemoCubitStateImpl) then) =
      __$$MemoCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> listOfWords,
      Filter filter,
      List<int> filteredKeys,
      List<StudyCardModel> questions});
}

/// @nodoc
class __$$MemoCubitStateImplCopyWithImpl<$Res>
    extends _$MemoCubitStateCopyWithImpl<$Res, _$MemoCubitStateImpl>
    implements _$$MemoCubitStateImplCopyWith<$Res> {
  __$$MemoCubitStateImplCopyWithImpl(
      _$MemoCubitStateImpl _value, $Res Function(_$MemoCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemoCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfWords = null,
    Object? filter = null,
    Object? filteredKeys = null,
    Object? questions = null,
  }) {
    return _then(_$MemoCubitStateImpl(
      listOfWords: null == listOfWords
          ? _value._listOfWords
          : listOfWords // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
      filteredKeys: null == filteredKeys
          ? _value._filteredKeys
          : filteredKeys // ignore: cast_nullable_to_non_nullable
              as List<int>,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<StudyCardModel>,
    ));
  }
}

/// @nodoc

class _$MemoCubitStateImpl implements _MemoCubitState {
  const _$MemoCubitStateImpl(
      {final List<dynamic> listOfWords = const [],
      this.filter = Filter.all,
      final List<int> filteredKeys = const [],
      final List<StudyCardModel> questions = const []})
      : _listOfWords = listOfWords,
        _filteredKeys = filteredKeys,
        _questions = questions;

  final List<dynamic> _listOfWords;
  @override
  @JsonKey()
  List<dynamic> get listOfWords {
    if (_listOfWords is EqualUnmodifiableListView) return _listOfWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfWords);
  }

  @override
  @JsonKey()
  final Filter filter;
  final List<int> _filteredKeys;
  @override
  @JsonKey()
  List<int> get filteredKeys {
    if (_filteredKeys is EqualUnmodifiableListView) return _filteredKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredKeys);
  }

  final List<StudyCardModel> _questions;
  @override
  @JsonKey()
  List<StudyCardModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'MemoCubitState(listOfWords: $listOfWords, filter: $filter, filteredKeys: $filteredKeys, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoCubitStateImpl &&
            const DeepCollectionEquality()
                .equals(other._listOfWords, _listOfWords) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality()
                .equals(other._filteredKeys, _filteredKeys) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listOfWords),
      filter,
      const DeepCollectionEquality().hash(_filteredKeys),
      const DeepCollectionEquality().hash(_questions));

  /// Create a copy of MemoCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoCubitStateImplCopyWith<_$MemoCubitStateImpl> get copyWith =>
      __$$MemoCubitStateImplCopyWithImpl<_$MemoCubitStateImpl>(
          this, _$identity);
}

abstract class _MemoCubitState implements MemoCubitState {
  const factory _MemoCubitState(
      {final List<dynamic> listOfWords,
      final Filter filter,
      final List<int> filteredKeys,
      final List<StudyCardModel> questions}) = _$MemoCubitStateImpl;

  @override
  List<dynamic> get listOfWords;
  @override
  Filter get filter;
  @override
  List<int> get filteredKeys;
  @override
  List<StudyCardModel> get questions;

  /// Create a copy of MemoCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoCubitStateImplCopyWith<_$MemoCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
