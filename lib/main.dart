import 'package:box_color_list_1/container_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            primary: Colors.green,
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<BoxContainerModel> _boxContainerList = [
    BoxContainerModel(
      boxContainerId: 'primary (index 0)',
      boxContainerColor: Colors.lightBlue.shade100,
      deleteContainerBox: null,
    ),
    BoxContainerModel(
      boxContainerId: 'seconday (index 1)',
      boxContainerColor: Colors.lightGreen.shade100,
      deleteContainerBox: null,
    ),
  ];

  void _addBoxContainer() {
    if (_boxContainerList.length <= 3) {
      setState(() {
        _boxContainerList.add(
          BoxContainerModel(
            boxContainerId: '${_boxContainerList.length}',
            boxContainerColor: Colors.amber.shade100,
          ),
        );
      });
    }
  }

  void _deleteBoxContainer(int index) {
    setState(() {
      _boxContainerList.removeAt(index);
    });
    print('_deleteBoxContainer - ${[index]}');
  }

  showFloatingActionButton() {
    if (_boxContainerList.length <= 3) {
      return FloatingActionButton(
        onPressed: _addBoxContainer,
        child: Icon(Icons.add),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('box color list 1'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _boxContainerList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: _boxContainerList[index].boxContainerColor,
                title: Text(_boxContainerList[index].boxContainerId),
                trailing: GestureDetector(
                  onTap: () => _deleteBoxContainer(index),
                  child: Icon(
                    _boxContainerList[index].deleteContainerBox,
                  ),
                ),
                subtitle: Container(
                  color: Colors.grey,
                  height: 70,
                  child: Row(
                    children: [],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: showFloatingActionButton(),
    );
  }
}
