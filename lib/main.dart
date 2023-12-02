import 'package:animated_floating_action_button/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_picker_wheel/models/button_behaviour.dart';
import 'package:flutter_color_picker_wheel/presets/animation_config_presets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:adoptive_calendar/adoptive_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animated'),
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
  int _counter = 0;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  Color color = Color(0xff9A7CF8);
  DateTime? pickedDate;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => {pickerColor = color, print(color)});
  }

  Future showPicker() {
    // raise the [showDialog] widget
    return showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
          // Use Material color picker:
          //
          // child: MaterialPicker(
          //   pickerColor: pickerColor,
          //   onColorChanged: changeColor,
          // ),
          //
          // Use Block color picker:
          //
          // child: BlockPicker(
          //   pickerColor: currentColor,
          //   onColorChanged: changeColor,
          // ),
          //
          // child: MultipleChoiceBlockPicker(
          //   pickerColors: currentColor,
          //   onColorsChanged: changeColors,
          // ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xff100F11),
        appBar: AppBar(
          backgroundColor: Color(0xff100F11),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: AnimatedFloatingActionButton(
          borderRadius: BorderRadius.circular(20),
          backgroundColor: color,
          expandedHeight: screenSize.width * 100 / 100,
          expandedWidth: screenSize.width * 92 / 100,
          child: Stack(children: [
            Column(children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  maxLength: 22,
                  decoration: InputDecoration(
                    focusColor: Colors.amber,
                    hintStyle: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: const Color(0xff212127),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff212127)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff212127)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff212127)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Task Title',
                  ),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  0,
                  20,
                  0,
                ),
                child: TextField(
                  maxLength: 100,
                  decoration: InputDecoration(
                    focusColor: Colors.amber,
                    hintStyle: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: const Color(0xff212127),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff212127)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff212127)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff212127)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Description',
                  ),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Icon(
                        Icons.format_color_fill,
                        color: Colors.white,
                      ),
                      onPressed: () => showPicker(),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff60B478))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff60B478))),
                      onPressed: () {},
                      child: Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ]),
        ));
  }
}
