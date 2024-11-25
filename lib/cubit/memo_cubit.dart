import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:memo/data/memorisation_model.dart';

part 'memo_cubit_states.dart';
part 'memo_cubit.freezed.dart';

class MemoCubit extends Cubit<MemoCubitStates> {
  MemoCubit() : super(const MemoCubitStates()) {
    unawaited(_initHive());
  }

  final String memoryBoxName = 'MemorizationBox';

  Future<void> _initHive() async {
    await Hive.openBox<MemorisationModel>(memoryBoxName);
    final memoryBox = Hive.box<MemorisationModel>(memoryBoxName);
  }
}
