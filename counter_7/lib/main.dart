import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab PBP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = 'Counter 7';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(widget.title),
      ),

      // Menambahkan drawer menu
      drawer: buildDrawer(context),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Conditional for the Text shown
            if (_counter % 2 == 0)
              const Text( 
              'GENAP',
              style: TextStyle(
              color: Colors.red,
              ),
            ),
            if (_counter % 2 != 0) 
              const Text( 
              'GANJIL',
              style: TextStyle(
              color: Colors.blue,
              ),
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Decrement handler
              if (_counter != 0) 
              FloatingActionButton(
                onPressed: () {
                    if (_counter > 0) {
                      _decrementCounter();
                    }
                  },
                  child: const Icon(Icons.remove),
              ),
              Expanded(child: Container()),
              // Increment handler
              FloatingActionButton(
                  onPressed: () {
                    _incrementCounter();
                  },
                  child: const Icon(Icons.add),
              )
            ],
          ),
      )
    );
  }
}
