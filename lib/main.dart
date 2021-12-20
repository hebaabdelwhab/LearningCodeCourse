import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  int _radioValues=0;
  List ImgList = ['Images/Cairo.jpg','Images/download.jpg','Images/photo.jpg'];
  late String result;
  late Color resultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Demo"),),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Guess the answer : 2+2 = ?",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),),
            buildRow(3),
            buildRow(4),
            buildRow(5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  myDialg(){
    var ad = AlertDialog(
       content: Container(
         height: 100,
         child: Column(
           children: [
             Text("$result",style: TextStyle(color: resultColor),),
             Divider(),
             Text("Answer is :4")
           ],
         ),
       ),
    );
    showDialog(context: context,builder:(context) => ad,);
 }
  Row buildRow(int Value){
    return Row(
            children: [
            Radio(value: Value, groupValue:_radioValues, onChanged:(value){
              setState(() {
                _radioValues =Value;
                result =Value==4?"Correct answer":"Wrong answer";
                resultColor = Value==4?Colors.green:Colors.red;
                myDialg();
              });
            }),
            Text("$Value"),
           ],
          );
  }
  ListView buildListView() {
    return ListView(
      children: [
      SizedBox(height: 30,),
      Text(
        "Slider 1 : Initial page index 0\n\n",
        textAlign: TextAlign.center,
      ),
      CarouselSlider(
          items:ImgList.map((URLImage){
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(URLImage,fit: BoxFit.fill,),
            );
          }).toList(),
          options: CarouselOptions(height: 200,initialPage: 0)
      ),
      CarouselSlider.builder(
          itemCount:ImgList.length,
          itemBuilder: (BuildContext context,int index,int){
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(ImgList[index],fit: BoxFit.fill,),
            );
          },
          options: CarouselOptions(height: 200,initialPage: 0)
      )
    ],);
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
