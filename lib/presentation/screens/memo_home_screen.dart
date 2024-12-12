import 'package:flutter/material.dart';
import 'package:memo/presentation/screens/memo_card_study_screen.dart';
import 'package:memo/presentation/screens/memo_word_screen.dart';
import 'package:memo/srs/colors.dart';

class MemoHomeScreen extends StatelessWidget {
  const MemoHomeScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: milkColor,
            unselectedLabelColor: lightGreyColor,
            indicatorColor: milkColor,
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
              'Mémo',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MemoWordScreen(),
            MemoCardStudyScreen(),
          ],
        ),
      );
}
