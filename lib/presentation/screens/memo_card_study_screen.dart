import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo/cubit/memo_cubit.dart';
import 'package:memo/data/study_card_model.dart';
import 'package:memo/presentation/widgets/study_card.dart';
import 'package:memo/srs/colors.dart';
import 'package:memo/srs/icons.dart';

class MemoCardStudyScreen extends StatefulWidget {
  const MemoCardStudyScreen({super.key});

  @override
  State<MemoCardStudyScreen> createState() => _MemoCardStudyScreenState();
}

class _MemoCardStudyScreenState extends State<MemoCardStudyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    await context.read<MemoCubit>().loadQuestions();
    super.didChangeDependencies();
  }

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<MemoCubit, MemoCubitState>(
        builder: (final context, final state) {
          if (state.questions.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final questions = state.questions;
          return Swiper(
            itemCount: questions.length,
            itemBuilder: (final context, final index) {
              final backgroundColor = studyCardBackgroundColors[
                  index % studyCardBackgroundColors.length];
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
        },
      );
}
