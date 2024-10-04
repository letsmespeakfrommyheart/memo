import 'package:flutter/material.dart';
import 'package:memo/colors.dart';
import 'package:memo/memorisation_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String memoryBoxName = "MemorisationBox";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(MemorisationModelAdapter());
  await Hive.openBox<MemorisationModel>(memoryBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.caveatTextTheme(Theme.of(context).textTheme),
          inputDecorationTheme: InputDecorationTheme(focusColor: green),
          appBarTheme: AppBarTheme(backgroundColor: green, shadowColor: milk),
          scaffoldBackgroundColor: milk,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: red),
          dialogTheme: DialogTheme(
            backgroundColor: milk,
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

enum Filter { all, remembered, unremembered }

class MyHomePageState extends State<MyHomePage> {
  late Box<MemorisationModel> memoryBox;

  final TextEditingController wordController = TextEditingController();
  final TextEditingController transcriptionController = TextEditingController();
  final TextEditingController translationController = TextEditingController();

  Filter filter = Filter.all;

  @override
  void initState() {
    super.initState();
    memoryBox = Hive.box<MemorisationModel>(memoryBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            // 6 steps for Android
            "      Mémo",
            style: TextStyle(fontSize: 30),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.arrow_drop_down,
                )),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            color: milk,
            onSelected: (value) {
              if (value.compareTo('Tous') == 0) {
                setState(() {
                  filter = Filter.all;
                });
              } else if (value.compareTo('Mémorisé') == 0) {
                setState(() {
                  filter = Filter.remembered;
                });
              } else {
                setState(() {
                  filter = Filter.unremembered;
                });
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                "Tous",
                "Mémorisé",
                "Non mémorisé",
              ].map((option) {
                return PopupMenuItem(
                  textStyle: const TextStyle(
                      fontSize: 20, color: Colors.black, fontFamily: 'Caveat'),
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: memoryBox.listenable(),
        builder: (context, Box<MemorisationModel> words, _) {
          List<int> keys;

          if (filter == Filter.all) {
            keys = words.keys.cast<int>().toList();
          } else if (filter == Filter.remembered) {
            keys = words.keys
                .cast<int>()
                .where((key) => words.get(key)!.isLearned)
                .toList();
          } else {
            keys = words.keys
                .cast<int>()
                .where((key) => !words.get(key)!.isLearned)
                .toList();
          }

          return ListView.separated(
            itemBuilder: (_, index) {
              final int key = keys[index];
              final MemorisationModel? memorisation = words.get(key);
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 10.0, right: 5.0),
                minLeadingWidth: 0.0,
                minVerticalPadding: 0.0,
                title: Transform.translate(
                  offset: const Offset(0.0, 1.0),
                  child: Text(
                    memorisation!.word,
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
                subtitle: Transform.translate(
                  offset: const Offset(0.0, -5.0),
                  child: Text('[ ${memorisation.transcription} ]',
                      style: const TextStyle(fontSize: 26)),
                ),
                leading: IconButton(
                    onPressed: () {
                      setState(() {
                        if (!memorisation.isLearned) {
                          MemorisationModel mTodo = MemorisationModel(
                              word: memorisation.word,
                              transcription: memorisation.transcription,
                              translation: memorisation.translation,
                              isLearned: true);
                          memoryBox.put(key, mTodo);
                        } else {
                          MemorisationModel mTodo = MemorisationModel(
                              word: memorisation.word,
                              transcription: memorisation.transcription,
                              translation: memorisation.translation,
                              isLearned: false);
                          memoryBox.put(key, mTodo);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.grade,
                      color: memorisation.isLearned
                          ? Colors.amber
                          : Colors.grey.shade600,
                      size: 32,
                    )),
                trailing: IconButton(
                    icon: const Icon(Icons.clear),
                    color: red,
                    onPressed: () {
                      setState(() {
                        memoryBox.deleteAt(index);
                        memoryBox.compact();
                      });
                    }),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                memorisation.translation,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 30),
                              ))));
                },
              );
            },
            separatorBuilder: (_, index) => const Divider(),
            itemCount: keys.length,
            shrinkWrap: true,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        cursorColor: teal,
                        style: const TextStyle(fontSize: 28),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: teal)),
                            hintText: "Un mot",
                            hintStyle: const TextStyle(fontSize: 24),
                            focusColor: Colors.grey),
                        controller: wordController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        cursorColor: teal,
                        style: const TextStyle(fontSize: 28),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: teal)),
                          hintText: "Une transcription",
                          hintStyle: const TextStyle(fontSize: 24),
                        ),
                        controller: transcriptionController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        cursorColor: teal,
                        style: const TextStyle(fontSize: 28),
                        decoration: InputDecoration(
                          hintText: "Une traduction",
                          hintStyle: const TextStyle(fontSize: 24),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: teal)),
                        ),
                        controller: translationController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final String wordText = wordController.text;
                          final String transcriptionText =
                              transcriptionController.text;
                          final String translationText =
                              translationController.text;

                          MemorisationModel todo = MemorisationModel(
                              word: wordText,
                              transcription: transcriptionText,
                              translation: translationText,
                              isLearned: false);

                          memoryBox.add(todo);
                          wordController.clear();
                          transcriptionController.clear();
                          translationController.clear();

                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(teal),
                            shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text(
                          "Ajouter un nouveau mot",
                          style: TextStyle(
                            fontSize: 22,
                            color: milk,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
