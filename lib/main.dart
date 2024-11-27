import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memo/data/filter_model.dart';
import 'package:memo/data/memorisation_model.dart';
import 'package:memo/presentation/widgets/memo_action_button.dart';
import 'package:memo/presentation/widgets/memo_popup_menu_button.dart';
import 'package:memo/presentation/widgets/memo_word_item.dart';
import 'package:memo/presentation/widgets/word_dialog.dart';
import 'package:memo/srs/colors.dart';
import 'package:path_provider/path_provider.dart';

// const String memoryBoxName = 'MemorisationBox';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..registerAdapter(MemorisationModelAdapter());
  // await Hive.openBox<MemorisationModel>(memoryBoxName);
  runApp(const MyApp());
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
  late Box<MemorisationModel> memoryBox;

  final TextEditingController wordController = TextEditingController();
  final TextEditingController transcriptionController = TextEditingController();
  final TextEditingController translationController = TextEditingController();

  Filter filter = Filter.all;

  @override
  void initState() {
    super.initState();
    // memoryBox = Hive.box<MemorisationModel>(memoryBoxName);
  }

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
              onSelectedItem: (final value) {
                if (value case 'All') {
                  setState(() {
                    filter = Filter.all;
                  });
                } else if (value case 'Learned') {
                  setState(() {
                    filter = Filter.remembered;
                  });
                } else if (value case 'Not learned') {
                  setState(() {
                    filter = Filter.unremembered;
                  });
                }
              },
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: memoryBox.listenable(),
          builder: (final context, final words, final _) {
            List<int> keys;

            switch (filter) {
              case Filter.all:
                keys = words.keys.cast<int>().toList();
              case Filter.remembered:
                keys = words.keys
                    .cast<int>()
                    .where((final key) => words.get(key)!.isLearned)
                    .toList();
              case Filter.unremembered:
                keys = words.keys
                    .cast<int>()
                    .where((final key) => !words.get(key)!.isLearned)
                    .toList();
            }

            return ListView.separated(
              itemBuilder: (final context, final index) {
                final int key = keys[index];
                final MemorisationModel? memoWord = words.get(key);
                if (memoWord != null) {
                  return MemoWordItem(
                    memorisationWord: memoWord.word,
                    memorisationTranscription: memoWord.transcription,
                    memorisationTranslation: memoWord.translation,
                    onChangeLearningState: () async {
                      // if (memoWord.isLearned case false) {
                      //   final learnedWord = MemorisationModel(
                      //     word: memoWord.word,
                      //     transcription: memoWord.transcription,
                      //     translation: memoWord.translation,
                      //     isLearned: true,
                      //   );
                      //   await memoryBox.put(key, learnedWord);
                      // } else if (memoWord.isLearned case true) {
                      //   final notLearnedWord = MemorisationModel(
                      //     word: memoWord.word,
                      //     transcription: memoWord.transcription,
                      //     translation: memoWord.translation,
                      //     isLearned: false,
                      //   );
                      //   await memoryBox.put(key, notLearnedWord);
                      // }
                    },
                    onDeleteWord: () async {
                      // await memoryBox.deleteAt(index);
                    },
                    onShowTranslate: () async {
                      // await showDialog(
                      //   context: context,
                      //   builder: (final context) => TranslateDialog(
                      //     translationText: memorisation.translation,
                      //   ),
                      // );
                    },
                    iconColor: memoWord.isLearned
                        ? Colors.amber
                        : Colors.grey.shade600,
                  );
                }
                return null;
              },
              separatorBuilder: (final context, final index) => const Divider(),
              itemCount: keys.length,
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

                  // final newWord = MemorisationModel(
                  //   word: wordText,
                  //   transcription: transcriptionText,
                  //   translation: translationText,
                  //   isLearned: false,
                  // );

                  // await memoryBox.add(newWord);
                  wordController.clear();
                  transcriptionController.clear();
                  translationController.clear();

                  // if (context.mounted) {
                  //   Navigator.pop(context);
                  // }
                },
              ),
            );
          },
        ),
      );
}
