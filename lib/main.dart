import 'package:box_color_list_1/container_model.dart';
import 'package:flutter/material.dart';
import 'package:box_color_list_1/box_tile.dart';

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
        child: const Icon(Icons.add),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('box color list 1'),
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
                subtitle: BoxTile(),
              ),
            );
          },
        ),
      ),
      floatingActionButton: showFloatingActionButton(),
    );
  }
}

class BoxTile extends StatefulWidget {
  const BoxTile({
    super.key,
  });

  @override
  State<BoxTile> createState() => _BoxTileState();
}

class _BoxTileState extends State<BoxTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GestureDetector(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.lightBlue,
              ),
            ),
            Text('box name...'),
            Text('box id ...')
          ],
        ),
      ),
    );
  }
}
