import 'package:fl_chart/fl_chart.dart';
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
var textController = TextEditingController();
String userPost = '';
double myDouble = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            //  Container(
            //   color: Colors.amber,
            //   width: 400,height: 600,
            // ),
                Container (
                child: Center(
                  child: Text(userPost),
                ),
              ),
            // text input
            SizedBox(
              width: 200,
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: 'whatd on your mind?',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        // clear text box
                        onPressed: () {
                          textController.clear();
                          double myDouble = textController as double;
                        },
                        icon: const Icon(Icons.clear))),
              ),
            ),
            SizedBox(height: 10,),
            // post button
               MaterialButton(
                onPressed: () {
                  setState(() {
                    userPost = textController.text;
                  });
                },
                color: Colors.red,
                child: const Text(
                  'post',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          const SizedBox(height: 20,),
            
              SizedBox(
                width: 400,
                height: 400,
                child:
                 PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 0,
                        color: Colors.blue,
                        title: '0%',
                        radius: 50,
                      ),
                      PieChartSectionData(
                        value: myDouble,
                        color: Colors.red,
                        title: myDouble.toString() + '%',
                        radius: 50,
                      ),
                      PieChartSectionData(
                        value: 50,
                        color: Colors.green,
                        title: '50%',
                        radius: 50,
                      ),
                    ],
                  ),
                ),
              ),
          
          ],
        ),
      ),
    );
  }
}
