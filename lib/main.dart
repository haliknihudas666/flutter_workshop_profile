import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final List<String> hobbies = [
    'Playing Games',
    'Photography',
    'Watching Movies'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://nicolei.games/_next/image?url=%2Fassets%2Fnicolei.jpg&w=1920&q=75',
                imageBuilder: (context, image) {
                  return CircleAvatar(
                    radius: 100,
                    foregroundImage: image,
                  );
                },
              ),
              const Text(
                'Nicolei Esperida',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  thickness: 5,
                ),
              ),
              const Text(
                'Hobbies',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: hobbies.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return Chip(
                        label: Text(hobbies[index]),
                      );
                    },
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 25,
                ),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.amber[600]),
                  onTap: () async {
                    launchUrl(Uri.parse('tel:09121231234'));
                  },
                  title: const Text(
                    '+63 9121231234',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ListTile(
                  leading: Icon(Icons.mail, color: Colors.amber[600]),
                  onTap: () async {
                    launchUrl(Uri.parse('mailto:important@nicolei.games'));
                  },
                  title: const Text(
                    'important@nicolei.games',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
