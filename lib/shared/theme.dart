part of "shared.dart";

const double defaultMargin = 24;

Color mainColor = const Color(0xFFFF9C06);
Color accentColor1 = const Color(0xFF1F0DEE);
Color accentColor2 = const Color(0xFF27D7D7);
Color accentColor3 = const Color(0xFFADADAD);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle orangeTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle greenNumberFont =
    GoogleFonts.openSans().copyWith(color: accentColor2);
