
import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex("#060f3a");
  static Color blue = HexColor.fromHex("#2bc7f0");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color gray = HexColor.fromHex("#595959");
  static Color black= HexColor.fromHex("#000000");
  static Color purpleBlack = HexColor.fromHex("#1A1A3F");
  static Color orangeLight = HexColor.fromHex("#EA3799");
  static Color grayLight = HexColor.fromHex("#D8DAE8");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}