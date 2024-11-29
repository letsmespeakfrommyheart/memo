import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memo/cubit/memo_cubit.dart';
import 'package:memo/data/memorisation_model.dart';
import 'package:memo/presentation/screens/memo_card_study_screen.dart';
import 'package:memo/presentation/screens/memo_word_screen.dart';
import 'package:memo/presentation/widgets/memo_action_button.dart';
import 'package:memo/presentation/widgets/memo_popup_menu_button.dart';
import 'package:memo/presentation/widgets/memo_word_item.dart';
import 'package:memo/presentation/widgets/word_dialog.dart';
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Caveat',
          inputDecorationTheme: InputDecorationTheme(focusColor: green),
          appBarTheme: AppBarTheme(backgroundColor: green, shadowColor: milk),
          scaffoldBackgroundColor: milk,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: red),
          dialogTheme: DialogTheme(
            backgroundColor: milk,
          ),
        ),
        home: const DefaultTabController(
          length: 2,
          child: MemoHomePage(),
        ),
      );
}

class MemoHomePage extends StatelessWidget {
  const MemoHomePage({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: milk,
            unselectedLabelColor: lightGrey,
            indicatorColor: milk,
            tabs: const [
              Text(
                'Word',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Study cards',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          title: const Center(
            child: Text(
              // 6 steps for Android
              '      Mémo',
              style: TextStyle(fontSize: 40),
            ),
          ),
          actions: <Widget>[
            MemoPopupMenuButton(
              onSelectedItem: context.read<MemoCubit>().onPopUp,
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            MemoWordScreen(),
            MemoCardStudyScreen(),
          ],
        ),
      );
}
