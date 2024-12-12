import 'package:flutter/material.dart';
import 'package:memo/srs/colors.dart';

class StudyCard extends StatelessWidget {
  const StudyCard({
    required this.text,
    required this.backgroundColor,
    this.icon,
    this.textAlign = TextAlign.start,
    super.key,
  });
  final String text;
  final TextAlign textAlign;
  final Color backgroundColor;
  final IconData? icon;

  @override
  Widget build(final BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        height: screenHeight * 0.6,
        width: screenWidth * 0.8,
        child: Card(
          elevation: 4,
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Text(
                        text,
                        textAlign: textAlign,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      icon,
                      color: greyColor.withOpacity(0.3),
                      size: 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
