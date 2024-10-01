import 'package:flutter/material.dart';
import 'package:sol_flutter/song_content.dart';
import 'package:sol_flutter/user_content.dart';
import 'package:sol_flutter/search_content.dart';
import 'package:sol_flutter/profile_content.dart';
import 'package:sol_flutter/playlist_content.dart';
import 'package:sol_flutter/comment_content.dart';

void main() {
  runApp(SolWeb());
}

class SolWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bar_index = 0;

  final List<Widget> _pages = [
    UserScreen(),
    SongScreen(),
    PlaylistScreen(),
    CommentScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _bar_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            // side bar
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                right: BorderSide(),
              )),
              width: 250,
              child: ListView(
                children: [
                  // header
                  DrawerHeader(
                    child: Image.asset('images/Sol-admin_logo.png', width: 60),
                  ),
                  // list 1
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black))),
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(
                              Icons.person_outline,
                              color: Colors.black,
                            ),
                            title: Text(
                              'User list',
                              style: TextStyle(color: Colors.black),
                            ),
                            onTap: () => _onItemTapped(0)),
                        ListTile(
                            leading: Icon(
                              Icons.music_note_outlined,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Song list',
                              style: TextStyle(color: Colors.black),
                            ),
                            onTap: () => _onItemTapped(1)),
                        ListTile(
                            leading: Icon(
                              Icons.playlist_play_outlined,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Playlist list',
                              style: TextStyle(color: Colors.black),
                            ),
                            onTap: () => _onItemTapped(2)),
                        ListTile(
                            leading: Icon(
                              Icons.comment_outlined,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Comment list',
                              style: TextStyle(color: Colors.black),
                            ),
                            onTap: () => _onItemTapped(3))
                      ],
                    ),
                  ),
                  // list 2
                  Column(
                    children: [
                      ListTile(
                          leading: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Main search',
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () => _onItemTapped(0)),
                      ListTile(
                          leading: Icon(
                            Icons.newspaper_outlined,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Profile & Admin list',
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () => _onItemTapped(1)),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: IndexedStack(
              index: _bar_index,
              children: _pages,
            ))
          ],
        ));
  }
}
