import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/database.dart';
import 'package:movie_app/home_module/components/notification_bar.dart';

import '../constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            IconlyLight.arrowLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notifications',
          style: kHomeModuleAppBarTitleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(
                IconlyLight.moreCircle,
                color: Colors.black,
              ),
              onPressed: () {
                // TODO: Add options functionality
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationBar(
              notificationImage: notifications.elementAt(index)['image']!,
              notificationTitle: notifications.elementAt(index)['title']!,
              notificationMessage: notifications.elementAt(index)['message']!,
              notificationTime: notifications.elementAt(index)['time']!,
            );
          },
        ),
      ),
    );
  }
}
