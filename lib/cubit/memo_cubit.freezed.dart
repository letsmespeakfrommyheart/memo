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
  String get popUpValue => throw _privateConstructorUsedError;
  List<dynamic> get items => throw _privateConstructorUsedError;

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
  $Res call({String popUpValue, List<dynamic> items});
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
    Object? popUpValue = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      popUpValue: null == popUpValue
          ? _value.popUpValue
          : popUpValue // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
  $Res call({String popUpValue, List<dynamic> items});
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
    Object? popUpValue = null,
    Object? items = null,
  }) {
    return _then(_$MemoCubitStatesImpl(
      popUpValue: null == popUpValue
          ? _value.popUpValue
          : popUpValue // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$MemoCubitStatesImpl implements _MemoCubitStates {
  const _$MemoCubitStatesImpl(
      {this.popUpValue = '', final List<dynamic> items = const []})
      : _items = items;

  @override
  @JsonKey()
  final String popUpValue;
  final List<dynamic> _items;
  @override
  @JsonKey()
  List<dynamic> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'MemoCubitStates(popUpValue: $popUpValue, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoCubitStatesImpl &&
            (identical(other.popUpValue, popUpValue) ||
                other.popUpValue == popUpValue) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, popUpValue, const DeepCollectionEquality().hash(_items));

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
      {final String popUpValue,
      final List<dynamic> items}) = _$MemoCubitStatesImpl;

  @override
  String get popUpValue;
  @override
  List<dynamic> get items;

  /// Create a copy of MemoCubitStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoCubitStatesImplCopyWith<_$MemoCubitStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
