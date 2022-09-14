import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/home_module/notification_screen.dart';
import 'package:movie_app/widgets/custom_buttons.dart';

class RecentHit extends StatefulWidget {
  const RecentHit(
      {Key? key, required this.image, required this.title, required this.genre})
      : super(key: key);
  final String image;
  final String title;
  final String genre;

  @override
  State<RecentHit> createState() => _RecentHitState();
}

class _RecentHitState extends State<RecentHit> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      width: double.infinity,
      height: height * 0.5,
      decoration: BoxDecoration(
        /// Recent Hit Poster Goes Here
        image: DecorationImage(
          image: NetworkImage(widget.image),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.15), BlendMode.darken),
        ),
      ),

      /// For title and other buttons
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 56.0, 16.0, 24.0),
        child: Stack(
          children: [
            /// Blur added over the image
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Company Logo, search and notification buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Company Logo
                    SizedBox(
                      height: 32.0,
                      width: 32.0,
                      child: Image.asset(
                        'assets/images/netflix.png',
                      ),
                    ),

                    /// Search Button and Notification Button
                    Row(
                      children: [
                        /// Search Button
                        IconButton(
                          onPressed: () {
                            // TODO: On Press trigger search action
                          },
                          icon: const Icon(
                            IconlyLight.search,
                            color: kHomeScreenTopBarIconColor,
                            size: kHomeScreenTopBarIconSize,
                          ),
                        ),

                        /// Notification Button
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationScreen(),
                              ),
                            );
                          },
                          icon: const Icon(
                            IconlyLight.notification,
                            color: kHomeScreenTopBarIconColor,
                            size: kHomeScreenTopBarIconSize,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                /// Poster Title, Genre, Play and add to list button
                SizedBox(
                  width: width * 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(
                        widget.title,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kHomeScreenRecentHitTitleTextStyle,
                      ),
                      const SizedBox(height: 6.0),

                      /// Genre
                      Text(
                        widget.genre,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kHomeScreenRecentHitGenreTextStyle,
                      ),
                      const SizedBox(height: 6.0),

                      /// Buttons
                      Row(
                        children: [
                          CustomButtons(
                            onPress: () {
                              // TODO: Play the movie
                            },
                            backgroundColor: kAppThemeRed,
                            borderColor: kAppThemeRed,
                            borderWidth: 2.0,
                            icon: IconlyBold.play,
                            label: 'Play',
                          ),
                          const SizedBox(width: 8.0),
                          CustomButtons(
                            onPress: () {
                              // TODO: Add to my list
                            },
                            backgroundColor: Colors.transparent,
                            borderColor: Colors.white,
                            borderWidth: 2.0,
                            icon: IconlyBold.plus,
                            label: 'My List',
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
