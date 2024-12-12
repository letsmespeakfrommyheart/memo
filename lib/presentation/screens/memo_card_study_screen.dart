import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo/cubit/memo_cubit.dart';
import 'package:memo/data/study_card_model.dart';
import 'package:memo/presentation/widgets/study_card.dart';
import 'package:memo/srs/colors.dart';

class MemoCardStudyScreen extends StatefulWidget {
  const MemoCardStudyScreen({super.key});

  @override
  State<MemoCardStudyScreen> createState() => _MemoCardStudyScreenState();
}

class _MemoCardStudyScreenState extends State<MemoCardStudyScreen> {
  late Future<List<StudyCardModel>> _listQuestions;
  final colors = [
    greenColor,
    lightOrange,
    yellow,
  ];
  final icons = [
    Icons.flutter_dash,
    Icons.electric_bolt,
    Icons.rocket_launch,
    Icons.mood,
    Icons.school,
    Icons.flash_on,
    Icons.extension,
    Icons.gesture,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    await (_listQuestions = context.read<MemoCubit>().loadQuestions());
    super.didChangeDependencies();
  }

  @override
  Widget build(final BuildContext context) => FutureBuilder(
        future: _listQuestions,
        builder: (final context, final snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Load questions error: $snapshot.error'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No questions & answers available'),
            );
          } else {
            final questions = snapshot.data!;
            return Swiper(
              itemCount: questions.length,
              itemBuilder: (final context, final index) {
                final backgroundColor = colors[index % colors.length];
                final backgroundIcon = icons[index % icons.length];
                return FlipCard(
                  front: StudyCard(
                    text: questions[index].question,
                    backgroundColor: backgroundColor,
                    textAlign: TextAlign.center,
                    icon: backgroundIcon,
                  ),
                  back: StudyCard(
                    text: questions[index].answer,
                    backgroundColor: backgroundColor,
                  ),
                );
              },
              layout: SwiperLayout.STACK,
              itemWidth: MediaQuery.of(context).size.width * 0.8,
            );
          }
        },
      );
}
