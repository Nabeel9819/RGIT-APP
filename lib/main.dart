import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: 'RGIT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff543B7A),

      ),
      home: MyHomePage(title: 'Flutter Post'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}): super(key:key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars),
       
          onPressed: (){

          },

        ),
        title: Container(
          alignment: Alignment.center,
          child: Text("RGIT",style: TextStyle()),

        ),
        actions: <Widget>[
          IconButton(icon: Icon(
          FontAwesomeIcons.newspaper,
          size: 20.0,
          color: Colors.white,
            
          ),
          onPressed: null,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Post').snapshots(),
        builder:(context,snapshot){
          if(!snapshot.hasData){
            const Text("Loading");
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context,index){
                DocumentSnapshot mypost = snapshot.data.documents[index];
                return Stack(
                  children: <Widget>[
                    Column(children: <Widget>[
                      Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350.0,
                      child: Padding(
                        padding: EdgeInsets.only(top:8.0,bottom:8.0),
                        child: Material(
                          color: Colors.white,
                          elevation: 14.0,
                          shadowColor: Color(0x802196F3),
                          child: Center(child: Padding(padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Container(child: Column(children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200.0,
                                  child: Image.network(
                                    '${mypost['Image']}',
                                    fit :BoxFit.fill,
                                  ),   ),
                                  SizedBox(height:10.0),
                                  Text('${mypost['Title']}',
                                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                   SizedBox(height:10.0),
                                  Text('${mypost['Sub-Title']}',
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                  ),
                                   
                              ],))
                            ]
                          )
                          
                          ,),)
                        ),
                      ),

                    ),
                    ]),
                   Container(
                          alignment:Alignment.topRight,
                          padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height*.26,
                          left: MediaQuery.of(context).size.height*.4,
                          ),
                          child: Container(
                            width:MediaQuery.of(context).size.width*50,
                            

                            child: FloatingActionButton(
                              child: CircleAvatar(
                              backgroundColor: Color(0xff543B7A),
                              child: Icon(Icons.book,color:Colors.white, size:20.0)
                              //onPressed:(){

                              //}
                            ),
                              backgroundColor: Color(0xff543B7A),
                            elevation: 0,
                              onPressed: () => { 
                              },
    ),
                          ),
                    ),

                  ],
                );
              },
              
              );
          }
        } ,
      ),
    );
  }
}