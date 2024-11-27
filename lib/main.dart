import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memo/cubit/memo_cubit.dart';
import 'package:memo/data/memorisation_model.dart';
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
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final TextEditingController wordController = TextEditingController();
  final TextEditingController transcriptionController = TextEditingController();
  final TextEditingController translationController = TextEditingController();

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              // 6 steps for Android
              '      Mémo',
              style: TextStyle(fontSize: 30),
            ),
          ),
          actions: <Widget>[
            MemoPopupMenuButton(
              onSelectedItem: context.read<MemoCubit>().onPopUp,
            ),
          ],
        ),
        body: BlocBuilder<MemoCubit, MemoCubitStates>(
          builder: (final context, final state) {
            final memoCubit = context.read<MemoCubit>();
            final filteredKeys = memoCubit.state.filteredKeys;
            return ListView.separated(
              itemCount: filteredKeys.length,
              itemBuilder: (final context, final index) {
                final key = filteredKeys[index];
                final memoWord = memoCubit.memoryBox.get(key);
                if (memoWord != null) {
                  return MemoWordItem(
                    memorisationWord: memoWord.word,
                    memorisationTranscription: memoWord.transcription,
                    memorisationTranslation: memoWord.translation,
                    onChangeLearningState: () async {
                      await context
                          .read<MemoCubit>()
                          .onChangeLearningState(memoWord, key);
                    },
                    onDeleteWord: () async {
                      await context.read<MemoCubit>().onDeleteWord(index);
                    },
                    onShowTranslate: () async {
                      await context
                          .read<MemoCubit>()
                          .onShowTranslate(context, memoWord);
                    },
                    iconColor: memoWord.isLearned
                        ? Colors.amber
                        : Colors.grey.shade600,
                  );
                }
                return null;
              },
              separatorBuilder: (final context, final index) => const Divider(),
              shrinkWrap: true,
            );
          },
        ),
        floatingActionButton: MemoActionButton(
          onActionButtonPressed: () async {
            await showDialog(
              context: context,
              builder: (final context) => WordDialog(
                wordController: wordController,
                transcriptionController: transcriptionController,
                translationController: translationController,
                toAddNewWord: () async {
                  final String wordText = wordController.text;
                  final String transcriptionText = transcriptionController.text;
                  final String translationText = translationController.text;

                  await context.read<MemoCubit>().addNewWord(
                        wordText,
                        transcriptionText,
                        translationText,
                        context,
                      );
                  wordController.clear();
                  transcriptionController.clear();
                  translationController.clear();
                },
              ),
            );
          },
        ),
      );
}
