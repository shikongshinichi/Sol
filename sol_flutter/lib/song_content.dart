import 'package:flutter/material.dart';

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment(0, 0),
        margin: EdgeInsets.all(0),
        // of all content
        child: ListView(
          children: [
            // of header
            Row(
              children: [
                // input seach
                Expanded(
                    child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                        ),
                      )),
                )),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/perfil.png'),
                    ),
                    Column(
                      children: [
                        Text('Shikongshikong'),
                        Text(
                          'Admin',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            // btns
            Container(
              alignment: Alignment(10, 5),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      iconColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10), // Spacing between buttons
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      iconColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    label: Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      iconColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // table
            Expanded(
                child: Table(
              border: TableBorder.symmetric(),
              children: [
                TableRow(
                  children: [
                    Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        }),
                    Text('Num'),
                    Text('ID'),
                    Text('Name'),
                    Text('Email'),
                    Text('Birthday'),
                    Text('Image')
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 227, 227)),
                  children: [
                    Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        }),
                    Text('01'),
                    Text('01'),
                    Text('Kongshin'),
                    Text('Kongshin@gmail.com'),
                    Text('01/20/2134'),
                    Image.asset('images/green.jpg',
                        width: 60, height: 60, fit: BoxFit.cover),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
