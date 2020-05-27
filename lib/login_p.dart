import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/main.dart';



class LoginPage extends StatelessWidget {


  Widget  createEmailinput (){
  return Padding(
             padding: const EdgeInsets.only( top: 40 ),
          child: TextFormField(
             decoration: InputDecoration( hintText: '   Usuario O Correo electronico'),
          ),
           );
  }

  Widget createPassInput (){
    return Padding(
             padding: const EdgeInsets.only(top:40),
             child: TextFormField(
               decoration: InputDecoration( hintText: '    Contraseña'),
               obscureText: true,
             ),
           );
  }

Widget createLoginButton(){
  return Container(
    padding: const EdgeInsets.only(top: 32),
    child: RaisedButton(
      child: Text('Entrar'),
      onPressed: () {
   
   
      } 
      )
  );
}

Inicio inicio() => Inicio();

Widget createAccountLink (){
  return Container(
    padding: EdgeInsets.only(top: 22),
    child: Text( 'Crear Tu cuenta Aqui!',
      textAlign: TextAlign.right,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

Widget renderDivider(){

return Container(
  padding: const EdgeInsets.only(top: 32),
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
    padding: const EdgeInsets.only(top: 32),
    child: RaisedButton(
      color: Color.fromRGBO(59, 89, 152, 1),
      textColor: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.facebookSquare),
          Expanded(
             child: Text('Entrar con Facebook', textAlign: TextAlign.center,)
      )
      ],
      ), onPressed: () {},
      )
  );
      
}


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.indigoAccent[50]),
      child: ListView(
        children: [
          Image.network('https://1.bp.blogspot.com/-VVWnFmywCy8/Xp3aTZERxaI/AAAAAAAAA6Y/miO3uAWqpVI1Ki7NeekMYbFCVEpZeYd6wCLcBGAsYHQ/s1600/T2logo.png',
          height: 220,
          
          ),
          
          
          createEmailinput(),
          createPassInput(),
          createLoginButton(),
          createAccountLink (),
          renderDivider(),
          rFacebookBtn() 
        ],
      ),
    )
    );
  }
}