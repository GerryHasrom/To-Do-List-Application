import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // Daftar kegiatan untuk setiap kategori
  List<String> _todoItems = [];
  List<String> _inProgressItems = [];
  List<String> _doneItems = [];

  // Daftar checkbox status untuk setiap kategori
  List<bool> _todoChecked = [];
  List<bool> _inProgressChecked = [];
  List<bool> _doneChecked = [];

  // Method untuk menambahkan item baru
  void _addItem(String category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController _controller = TextEditingController();

        return AlertDialog(
          title: Text('Tambah Kegiatan'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Masukkan kegiatan baru',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  if (_controller.text.isNotEmpty) {
                    switch (category) {
                      case 'To-Do':
                        _todoItems.add(_controller.text);
                        _todoChecked.add(false);
                        break;
                      case 'In Progress':
                        _inProgressItems.add(_controller.text);
                        _inProgressChecked.add(false);
                        break;
                      case 'Done':
                        _doneItems.add(_controller.text);
                        _doneChecked.add(false);
                        break;
                    }
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Activity'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                _buildActivityContainer('To-Do', _todoItems, _todoChecked, (index) {
                  setState(() {
                    _todoChecked[index] = !_todoChecked[index];
                  });
                }),
                SizedBox(height: 16),
                _buildActivityContainer('In Progress', _inProgressItems, _inProgressChecked, (index) {
                  setState(() {
                    _inProgressChecked[index] = !_inProgressChecked[index];
                  });
                }),
                SizedBox(height: 16),
                _buildActivityContainer('Done', _doneItems, _doneChecked, (index) {
                  setState(() {
                    _doneChecked[index] = !_doneChecked[index];
                  });
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _addItem('To-Do'),
                  child: Text('Tambah To-Do'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFD500), 
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _addItem('In Progress'),
                  child: Text('Tambah In Progress'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD30000), 
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _addItem('Done'),
                  child: Text('Tambah Done'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF311432), 
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityContainer(String title, List<String> items, List<bool> checkedList, Function(int) onChecked) {
    Color borderColor;
    switch (title) {
      case 'To-Do':
        borderColor = Color(0xFFFFD500); 
        break;
      case 'In Progress':
        borderColor = Color(0xFFD30000); 
        break;
      case 'Done':
        borderColor = Color(0xFF311432); 
        break;
      default:
        borderColor = Colors.grey[300]!;
    }

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, 
        border: Border.all(color: borderColor), 
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.white, 
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
          ),
          SizedBox(height: 10),
          ...List.generate(items.length, (index) {
            return ListTile(
              title: Text(items[index]),
              trailing: Checkbox(
                value: checkedList[index],
                onChanged: (bool? value) {
                  onChecked(index);
                },
              ),
              tileColor: checkedList[index] ? Colors.grey[300] : Colors.white,
              textColor: checkedList[index] ? Colors.grey : Colors.black,
              shape: checkedList[index] ? Border.all(color: Colors.grey) : null,
            );
          }),
        ],
      ),
    );
  }
}
