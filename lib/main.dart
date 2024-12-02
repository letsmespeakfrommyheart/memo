import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memo/cubit/memo_cubit.dart';
import 'package:memo/data/memorisation_model.dart';
import 'package:memo/presentation/screens/memo_home_screen.dart';
import 'package:memo/srs/colors.dart';
import 'package:path_provider/path_provider.dart';

const String memoryBoxName = 'MemorisationBox';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..registerAdapter(MemorisationModelAdapter());
  final memoryBox = await Hive.openBox<MemorisationModel>(memoryBoxName);
  runApp(
    BlocProvider(
      create: (final context) => MemoCubit(memoryBox),
      child: const MemoApp(),
    ),
  );
}

class MemoApp extends StatelessWidget {
  const MemoApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Caveat',
          inputDecorationTheme: InputDecorationTheme(focusColor: greenColor),
          appBarTheme:
              AppBarTheme(backgroundColor: greenColor, shadowColor: milkColor),
          scaffoldBackgroundColor: milkColor,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: redColor),
          dialogTheme: DialogTheme(
            backgroundColor: milkColor,
          ),
        ),
        home: const DefaultTabController(
          length: 2,
          child: MemoHomeScreen(),
        ),
      );
}
