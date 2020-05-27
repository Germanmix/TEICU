import 'package:flutter/material.dart';
import 'package:tutorial/entrada.dart';
//import 'dart:async';
//import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(

        buttonTheme: ButtonThemeData(height: 50),
        textTheme: TextTheme(
          subhead: TextStyle( fontSize: 18,
          ),
          button: TextStyle(
            fontSize: 16,
          )
        ),
        dividerColor: Colors.black,
        primaryColor: Colors.indigoAccent[100]
      ),
      routes: <String, WidgetBuilder>{
        "/inicio" : (BuildContext context) => Inicio(),
        "/reporte" :(BuildContext context) => Reporte(),
        "/horario" : (BuildContext context) => Horario(),
        "/otros" : (BuildContext context) => Otro(),

      }
      ,
      home: AnimacionWave()
      
    );
  }
}

class Reporte extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new  Text("REGISTRO"),),
      body: Center(
        child: Text ("Seccion de Reportes"),
      ),
    );
  }
}

class Horario extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new  Text("HORARIO"),),
      body: Center(
        child: Text ("Seccion de Horarios"),
      ),
    );
  }
}


class Otro extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new  Text("OTROS"),),
      body: Center(
        child: Text ("Seccion de Otros"),
      ),
    );
  }
}


class Inicio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 190,
          bottom: 10,
          right: 10,
          left: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.indigoAccent[100],
          image: DecorationImage(
            image: NetworkImage('https://1.bp.blogspot.com/-PyYDHE4Drr4/XpysSbfg9cI/AAAAAAAAA4o/WCLCqvAy2RYP9IS8yVABN-kkAGHpDqodACLcBGAsYHQ/s1600/font.jpg'), 
            alignment: Alignment.topCenter
            )),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                      Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/reporte");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child:  Center(
                            child: Text("REGISTRO",style: TextStyle(fontSize: 19.0),
                          textAlign: TextAlign.center,),
                          ),
                        ),
                      )
                    )
                  ],
                ),
                 Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/reporte");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child:  Center(
                            child: Text("REPORTE",style: TextStyle(fontSize: 19.0),
                          textAlign: TextAlign.center,),
                          ),
                        ),
                      )
                    )
                  ],
                ),    
              ],
            ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                      Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/horario");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child:  Center(
                            child: Text("HORARIO",style: TextStyle(fontSize: 19.0),
                          textAlign: TextAlign.center,),
                          ),
                        ),
                      )
                    )
                  ],
                ),
                 Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/otros");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child:  Center(
                            child: Text("OTROS",style: TextStyle(fontSize: 19.0),
                          textAlign: TextAlign.center,),
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                      Padding(
                      padding: EdgeInsets.all(92),
                      child: RaisedButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                          MaterialPageRoute(
                          builder: (context) => AnimacionWave(
                          )),
                         );
                        },
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child:  Center(
                            child: Text("Salir",style: TextStyle(fontSize: 19.0),
                          textAlign: TextAlign.center,),
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
          ],
       ),
      )
    );
  }
}

