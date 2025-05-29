import 'package:flutter/material.dart';
import 'package:numeric_selector/numeric_selector.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
      ),
      home: const MyHomePage(title: 'My AI Fitness Buddy'),
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
  _addExercise() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddExerciseDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExercise,
        tooltip: 'Add Exercise',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AddExerciseDialog extends StatefulWidget {
  const AddExerciseDialog({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddExerciseDialogState();
  }
}

class _AddExerciseDialogState extends State<AddExerciseDialog> {
  int _numberOfSets = 4;
  List<Widget> sets = [];

  Widget _generateSetConfigurations() {

    sets = [];

    for (int i = 0; i < _numberOfSets; i++) {
      sets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(4.0), child: Text("Reps")),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: VerticalNumericSelector(
                minValue: 0,
                maxValue: 100,
                step: 1,
                initialValue: 10,
                onValueChanged: (value) {
                  // Do nothing for now
                },
                viewPort: 0.3,
                height: 50,
                selectedTextStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                unselectedTextStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.white,
                showLabel: true,
                label: "Number Of Reps",
                showArrows: false,
                enableVibration: true,
                showSelectedValue: false,
              ),
            ),
            Spacer(),
            Padding(padding: EdgeInsets.all(4.0), child: Text("Weight")),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: VerticalNumericSelector(
                minValue: 0,
                maxValue: 600,
                step: 5,
                initialValue: 30,
                onValueChanged: (value) {
                  // Do nothing for now
                },
                height: 50,
                viewPort: 0.3,
                selectedTextStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                unselectedTextStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.white,
                showLabel: true,
                label: "Weight",
                showArrows: false,
                enableVibration: true,
                showSelectedValue: false,
              ),
            ),
          ],
        ),
      );
    }

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: sets);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Container(
            height: 500,
            width: 300,
            color: Colors.blue.shade100,
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: "Exercise Name",
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                      ),
                    ),
                    Text("Sets"),
                    HorizontalNumericSelector(
                      minValue: 0,
                      maxValue: 10,
                      step: 1,
                      initialValue: 4,
                      onValueChanged: (value) {
                        setState(() {
                          _numberOfSets = value;
                        });
                      },
                      viewPort: 0.3,
                      selectedTextStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedTextStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                      backgroundColor: Colors.white,
                      showLabel: true,
                      label: "Number Of Sets",
                      showArrows: false,
                      enableVibration: true,
                      showSelectedValue: false,
                    ),
                    _generateSetConfigurations(),
                    ElevatedButton(
                      onPressed: () {
                        return Navigator.of(context).pop();
                      },
                      child: Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
