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
mixin _$MemoCubitStates {
  List<dynamic> get listOfWords => throw _privateConstructorUsedError;
  Filter get filter => throw _privateConstructorUsedError;
  List<int> get filteredKeys => throw _privateConstructorUsedError;

  /// Create a copy of MemoCubitStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoCubitStatesCopyWith<MemoCubitStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCubitStatesCopyWith<$Res> {
  factory $MemoCubitStatesCopyWith(
          MemoCubitStates value, $Res Function(MemoCubitStates) then) =
      _$MemoCubitStatesCopyWithImpl<$Res, MemoCubitStates>;
  @useResult
  $Res call({List<dynamic> listOfWords, Filter filter, List<int> filteredKeys});
}

/// @nodoc
class _$MemoCubitStatesCopyWithImpl<$Res, $Val extends MemoCubitStates>
    implements $MemoCubitStatesCopyWith<$Res> {
  _$MemoCubitStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoCubitStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfWords = null,
    Object? filter = null,
    Object? filteredKeys = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoCubitStatesImplCopyWith<$Res>
    implements $MemoCubitStatesCopyWith<$Res> {
  factory _$$MemoCubitStatesImplCopyWith(_$MemoCubitStatesImpl value,
          $Res Function(_$MemoCubitStatesImpl) then) =
      __$$MemoCubitStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> listOfWords, Filter filter, List<int> filteredKeys});
}

/// @nodoc
class __$$MemoCubitStatesImplCopyWithImpl<$Res>
    extends _$MemoCubitStatesCopyWithImpl<$Res, _$MemoCubitStatesImpl>
    implements _$$MemoCubitStatesImplCopyWith<$Res> {
  __$$MemoCubitStatesImplCopyWithImpl(
      _$MemoCubitStatesImpl _value, $Res Function(_$MemoCubitStatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemoCubitStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfWords = null,
    Object? filter = null,
    Object? filteredKeys = null,
  }) {
    return _then(_$MemoCubitStatesImpl(
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
    ));
  }
}

/// @nodoc

class _$MemoCubitStatesImpl implements _MemoCubitStates {
  const _$MemoCubitStatesImpl(
      {final List<dynamic> listOfWords = const [],
      this.filter = Filter.all,
      final List<int> filteredKeys = const []})
      : _listOfWords = listOfWords,
        _filteredKeys = filteredKeys;

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

  @override
  String toString() {
    return 'MemoCubitStates(listOfWords: $listOfWords, filter: $filter, filteredKeys: $filteredKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoCubitStatesImpl &&
            const DeepCollectionEquality()
                .equals(other._listOfWords, _listOfWords) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality()
                .equals(other._filteredKeys, _filteredKeys));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listOfWords),
      filter,
      const DeepCollectionEquality().hash(_filteredKeys));

  /// Create a copy of MemoCubitStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoCubitStatesImplCopyWith<_$MemoCubitStatesImpl> get copyWith =>
      __$$MemoCubitStatesImplCopyWithImpl<_$MemoCubitStatesImpl>(
          this, _$identity);
}

abstract class _MemoCubitStates implements MemoCubitStates {
  const factory _MemoCubitStates(
      {final List<dynamic> listOfWords,
      final Filter filter,
      final List<int> filteredKeys}) = _$MemoCubitStatesImpl;

  @override
  List<dynamic> get listOfWords;
  @override
  Filter get filter;
  @override
  List<int> get filteredKeys;

  /// Create a copy of MemoCubitStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoCubitStatesImplCopyWith<_$MemoCubitStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
