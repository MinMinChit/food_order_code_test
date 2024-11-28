import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KStyle {
  static Color cRed = const Color(0xFFED1C24);
  static Color cWhite = const Color(0xFFFFFFFF);
  static Color cBlack = const Color(0xFF000000);
  static Color cBg1 = const Color(0xFFF9F9F9);
  static Color cBg2 = const Color(0xFFF4F4F4);
  static Color cBg3 = const Color(0xFFF0F1F6);
  static Color cStroke = const Color(0xFFE0E0E0);
  static Color cGray = const Color(0xFF898989);
  static Color cText = const Color(0xFF221E20);
  static Color cGreen = const Color(0xFF5CB83E);
  static Color cLink = const Color(0xFF0042EC);
  static Color cAlert = const Color(0xFFFFD100).withOpacity(0.22);
  static Color cCyan = const Color(0xFF3CDBC0);
  static Color cPink = const Color(0xFFF04E98);
  static Color cYellow = const Color(0xFFFFD100);
  static Color cBlue = const Color(0xFF0047BB);
  static Color cRed2 = const Color(0xFFFF585D);
  static Color cRed3 = const Color(0xFFCB2C30);
  static Color cCyan2 = const Color(0xFF86C8BC);
  static Color cCyan3 = const Color(0xFFF09491);
  static Color cYellow2 = const Color(0xFFF1C400);
  static Color cBlue2 = const Color(0xFF141B4D);

  static Color cFaYellow = const Color(0xFFFAF2C3);

  //heading

  static TextStyle tTitle = GoogleFonts.rubik(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: cText,
  );

  static TextStyle tTitleL = GoogleFonts.rubik(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: cText,
  );

  static TextStyle tTitleXl = GoogleFonts.outfit(
    fontWeight: FontWeight.w900,
    fontSize: 20,
    color: cText,
  );

  //texts

  static TextStyle tTextLarge = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: cText,
  );

  static TextStyle tTextMain = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: cText,
  );

  static TextStyle tHint = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: cText,
  );

  static TextStyle tTiny = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: cText,
  );

  //functions
  static TextStyle tInputLabel = GoogleFonts.rubik(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: cText,
  );

  static TextStyle tInputFont = GoogleFonts.notoSans(
    fontWeight: FontWeight.w300,
    fontSize: 18,
    color: cText,
  );

  static TextStyle tForm = GoogleFonts.notoSans(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: cText,
  );

  static TextStyle tButton = GoogleFonts.notoSans(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: cText,
  );

  static TextStyle tSticker1 = GoogleFonts.notoSans(
    fontWeight: FontWeight.w600,
    fontSize: 10,
    color: cText,
  );

  static TextStyle tSticker2 = GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 5,
    color: cText,
  );

  static TextStyle tBannerText = GoogleFonts.outfit(
    fontWeight: FontWeight.w900,
    fontSize: 28,
    color: cText,
  );
}
