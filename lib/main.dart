import 'dart:convert';
import 'dart:math';

import 'package:cineconnect_tv/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<QuerySnapshot>? _storeStream;
  CollectionReference? users;
  //  = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    getDBID();
    super.initState();
  }

  void getDBID() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    if (id == null) {
      final newDBID = generateRandomAlphanumericString(12);
      prefs.setString('id', newDBID);
      _storeStream = FirebaseFirestore.instance.collection(newDBID).snapshots();
      users = FirebaseFirestore.instance.collection(newDBID);
    } else {
      _storeStream = FirebaseFirestore.instance.collection(id).snapshots();
      users = FirebaseFirestore.instance.collection(id);
    }

    users!.doc("h8FuIM0F4xO4Ddl3OnBz").set({
      "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "stream_link": "stream_link_shalmon",
      "subtitle_link": "subtitle_link_shalmon"
    });

    setState(() {});
  }

  String generateRandomAlphanumericString(int length) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      buffer.write(characters[random.nextInt(characters.length)]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _storeStream == null && users == null
          ? Container()
          : StreamBuilder<QuerySnapshot>(
              stream: _storeStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                if (snapshot.data!.docs.isEmpty) {
                  users!.add({
                    "timestamp":
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    "stream_link": "stream_link",
                    "subtitle_link": "subtitle_link"
                  });
                }

                final data = snapshot.data!.docs as List<DocumentSnapshot>;
                final documents = data
                    .map((element) =>
                        {element.id: element.data()} as Map<String, dynamic>)
                    .toList();

                print(jsonEncode(documents.first));
                return QrImageView(
                  data: jsonEncode(documents.first),
                  version: QrVersions.auto,
                  size: 200.0,
                );
              },
            ),
    );
  }
}
