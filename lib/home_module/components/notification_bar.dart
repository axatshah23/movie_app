import 'package:flutter/material.dart';

import '../../constants.dart';

class NotificationBar extends StatefulWidget {
  const NotificationBar(
      {Key? key,
      required this.notificationImage,
      required this.notificationTitle,
      required this.notificationMessage,
      required this.notificationTime})
      : super(key: key);
  final String notificationImage;
  final String notificationTitle;
  final String notificationMessage;
  final String notificationTime;

  @override
  State<NotificationBar> createState() => _NotificationBarState();
}

class _NotificationBarState extends State<NotificationBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Setup an event to redirect to the target page
      },
      child: Container(
        width: double.infinity,
        height: 110,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          /// Image and Info
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Poster
            Container(
              height: 110,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: NetworkImage(widget.notificationImage),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.0),

            /// Title, Notification Content and Time
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    widget.notificationTitle,
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kNotificationTitleTextStyle,
                  ),
                  const SizedBox(height: 6.0),

                  /// Notification Message
                  Text(
                    widget.notificationMessage,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kNotificationMessageTextStyle,
                  ),
                  const SizedBox(height: 6.0),

                  /// Time
                  Text(
                    widget.notificationTime,
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kNotificationTimeTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
