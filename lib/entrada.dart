import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutorial/reg.dart';
import 'dart:ui' as ui;
//import 'package:tutorial/login_p.dart';
import 'package:vector_math/vector_math.dart' as Vector;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;


class AnimacionWave extends StatefulWidget {
  @override
  _AnimacionWaveState createState() => new _AnimacionWaveState();

  AnimacionWave() {
    timeDilation = 1.0;
  }
}

class _AnimacionWaveState extends State<AnimacionWave> {
 
 Widget  createEmailinput (){
  return Padding(
             padding: const EdgeInsets.only( top: 230 ),
          child: TextFormField(
             decoration: InputDecoration( hintText: '    Usuario o Correo electronico'),
          ),
           );
  }

  Widget createPassInput (){
    return Padding(
             padding: const EdgeInsets.only(top: 300),
             child: TextFormField(
               decoration: InputDecoration( hintText: '    Contraseña', ),
               obscureText: true,
             ),
           );
  }
  /*
Widget createAccountLink (){
  
  return Container(
    padding:  EdgeInsets.only(top: 430),
     child:RaisedButton(
               color: Colors.white,
               shape: new RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.0)),
              child: Text("Registrar", style: TextStyle(fontSize: 19.0)),
              onPressed: (){ 

                Navigator.pushNamed(context, "/inicio");
                
                }
          ),
  );
}
 */

Widget renderDivider(){

return Container(
  padding: const EdgeInsets.only(top: 490),
  child: Row( 
    children: [
      Expanded(child: Divider(height: 1) ), 
      Text('0'),
       Expanded(child: Divider(height: 1))
      ],
  )
);
}
Widget rFacebookBtn(){
  return Container(
    padding: const EdgeInsets.only(top: 550),
    child: Container(
             child: Center(
          child:RaisedButton(
               color: Color.fromRGBO(59, 89, 152, 1),
               shape: new RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.0)),
               child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.facebookSquare),
          Expanded(
             child: Text('Entrar con Facebook', textAlign: TextAlign.center, style: TextStyle(fontSize: 19.0))
      )
      ],
      ), onPressed: () {},
      )
  )
    )
    );  
}

  @override
  Widget build(BuildContext context) {
    Size size = new Size(MediaQuery
        .of(context)
        .size
        .width, 250.0);
    return new Scaffold(
      backgroundColor: Colors.indigoAccent[100],
      body: Container(
        
        child: Column(
          children: <Widget>[
             Stack(
        children: <Widget>[
          new ColorCurveBody(   size: size, xOffset: 10, yOffset: -70, ),
          new ColorCurveBody(   size: size, xOffset: 10, yOffset: 100, color: Colors.white70),
          new ColorCurveBody(   size: size, xOffset: 10, yOffset: 130, color: Colors.indigoAccent[100]),
          new Positioned(
          top: 80,
          left: (MediaQuery.of(context).size.width/2)-80,
          child: Container(
            width: 130.0,
            height: 130.0,
            decoration: new BoxDecoration(
              shape:BoxShape.circle,
              border: Border.all( color: Colors.black, width:11),
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage("https://1.bp.blogspot.com/-VVWnFmywCy8/Xp3aTZERxaI/AAAAAAAAA6Y/miO3uAWqpVI1Ki7NeekMYbFCVEpZeYd6wCLcBGAsYHQ/s1600/T2logo.png")
                     )
            ),
          )
          ),
          createEmailinput(),
          createPassInput(),
          // createAccountLink (),
            renderDivider(),
           rFacebookBtn() ,
        new Positioned(
          top: 370,
           left: (MediaQuery.of(context).size.width/2)-80,
          child: Container(
             child: Center(
          child:RaisedButton(
               color: Colors.white,
               shape: new RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.0)),
              child: Text("Iniciar Sesion", style: TextStyle(fontSize: 19.0)),
              onPressed: (){ 

                Navigator.pushNamed(context, "/inicio");
                
                }
          ),
        )
          )),
         new Positioned(
          top: 430,
           left: (MediaQuery.of(context).size.width/2)-65,
          child: Container(
             child: Center(
          child:RaisedButton(
               color: Colors.white,
               shape: new RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.0)),
              child: Text("   Registrar   "),
              onPressed:  (){ 
                  Navigator.push(
                              context,
                          MaterialPageRoute(
                          builder: (context) => SignUpPage(
                          )),
                         );
                
                }
          ),
        )
          )
          )
          
        ],
      ),
        ],
        ),
        
      )
    );
  }
}

class ColorCurveBody extends StatefulWidget {
  final Size size;
  final int xOffset;
  final int yOffset;
  final Color color;

  ColorCurveBody(
      {Key key, @required this.size, this.xOffset, this.yOffset, this.color})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ColorCurveBodyState();
  }
}

class _ColorCurveBodyState extends State<ColorCurveBody>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<Offset> animList1 = [];

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animationController.addListener(() {
      animList1.clear();
      for (int i = -2 - widget.xOffset;
          i <= widget.size.width.toInt() + 2;
          i++) {
        animList1.add(new Offset(
            i.toDouble() + widget.xOffset,
            sin((animationController.value * 360 - i) %
                        360 *
                        Vector.degrees2Radians) *
                    20 +
                50 +
                widget.yOffset));
      }
    });
    animationController.repeat();
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: new CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => new ClipPath(
              child: widget.color == null
                  ? Image.network(
                      'https://1.bp.blogspot.com/-PyYDHE4Drr4/XpysSbfg9cI/AAAAAAAAA4o/WCLCqvAy2RYP9IS8yVABN-kkAGHpDqodACLcBGAsYHQ/s1600/font.jpg',
                      width: widget.size.width,
                      height: widget.size.height,
                      fit: BoxFit.cover,
                    )
                  : new Container(
                      width: widget.size.width,
                      height: widget.size.height,
                      color: widget.color,
                    ),
              clipper: new WaveClipper(animationController.value, animList1),
            ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}