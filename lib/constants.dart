import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Theme Colors and Fonts
const kScaffoldBackgroundColor = Colors.white;
TextTheme kAppFont = GoogleFonts.urbanistTextTheme();
const kAppThemeRed = Color(0xFFE21221);
const kAppThemeRedLight = Color(0xFFFCE7E9);
// Theme Colors end here

/// NavBar
const kNavBarElevation = 0.0;
const kNavBarBackgroundColor = Colors.white;
const kNavBarSelectedItemColor = kAppThemeRed;
const kNavBarSelectedItemTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 14.0,
);
const kUnSelectedItemColor = Color(0xFF9E9E9E);
const kNavBarUnSelectedItemTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 13.0,
);
const kNavBarIconSize = 28.0;
// Navbar ends here

/// Home Module
const kHomeScreenTopBarIconSize = 28.0;
const kHomeScreenTopBarIconColor = Colors.white;
const kHomeScreenRecentHitTitleTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const kHomeScreenRecentHitGenreTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);
const kHomeScreenFeaturedViewTitleTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
const kHomeScreenFeaturedViewTextButtonTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  color: kAppThemeRed,
);
const kFeaturedViewMovieRatingTextStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const kHomeModuleAppBarTitleTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
const kNotificationTitleTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w900,
  color: Colors.black,
);
const kNotificationMessageTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
const kNotificationTimeTextStyle = TextStyle(
  fontSize: 12.5,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
);
// Home Module ends here

/// Explore Module
const kExploreAppBarElevation = 0.0;
const kExploreAppBarBackgroundColor = Colors.white;
const kSearchBarIconColor = kAppThemeRed;
const kSearchBarBorderColor = kAppThemeRed;
const kSearchBarBorderWidth = 1.0;
const kSearchBarTextStyle = TextStyle(
  fontSize: 20.0,
  color: kAppThemeRed,
);
const kSearchBarHintTextStyle = TextStyle(
  fontSize: 16,
  color: kAppThemeRed,
);
const kSearchBarQueryTextStyle = TextStyle(
  fontSize: 16,
  color: kAppThemeRed,
);
const kFilterBarTitleTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
// Explore module ends here
