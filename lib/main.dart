import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Demo"),),
      body:ClippedText(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  Column ClippedText(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SelectableText(
            "My name is heba abdelwhab , working in company.",
            showCursor: true,
            cursorColor: Colors.green,
            toolbarOptions: ToolbarOptions(
              copy: true,
              cut: true,
              paste: true,
              selectAll: true,
            ),
          ),
          Container(
            width: 200,
            height: 40,
            color: Colors.green,
            child: Text("This Is aclipped text ,This Is aclipped text ,This Is aclipped text ,This Is aclipped text",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 29),
            overflow: TextOverflow.clip, // default mean that cut the text.
            softWrap: false, //in case true unlimit lines.
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 200,
            height: 40,
            color: Colors.green,
            child: Text("This Is aclipped text ,This Is aclipped text ,This Is aclipped text ,This Is aclipped text",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 29),
              overflow: TextOverflow.ellipsis, //dots instead of text as complement.
              softWrap: false,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 200,
            height: 40,
            color: Colors.green,
            child: Text("This Is aclipped text ,This Is aclipped text ,This Is aclipped text ,This Is aclipped text",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 29),
              overflow: TextOverflow.fade, //show text even this text is cutted.
            ),
          ),
          SizedBox(height: 8),
          Container( width: 200,
            height: 40,
            color: Colors.green,
            child: Text("This Is aclipped text ,This Is aclipped text ,This Is aclipped text ,This Is aclipped text",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 29),
              overflow: TextOverflow.visible,
              softWrap: false,
            ),),
          SizedBox(height: 8),
        ],
      );
  }
}
