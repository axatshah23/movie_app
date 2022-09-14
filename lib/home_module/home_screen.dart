import 'package:flutter/material.dart';
import 'package:movie_app/database.dart';
import 'package:movie_app/home_module/components/featured_view.dart';
import 'package:movie_app/home_module/components/recent_hit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// TODO: Set-Up Database such that required info can be passed to subsequent widgets.
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Recent Hit
            RecentHit(
                image: movies.first['poster']!,
                title: movies.first['title']!,
                genre: movies.first['genre']!),

            /// Top 10 Movies this week
            FeaturedView(title: 'Top Movies', content: movies),

            /// New Releases
            FeaturedView(title: 'Top TV Shows', content: shows),
          ],
        ),
      ),
    );
  }
}
