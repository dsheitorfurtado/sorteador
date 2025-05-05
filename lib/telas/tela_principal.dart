import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // isso é uma lista de texto, que contem o endereço das imagens
  List<String> images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg'  
  ];
  
  List<int> imagemSelecionada = [
    0,
    0,
    0,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baleia", style: TextStyle(
          fontSize: 30,
          backgroundColor: Colors.blue,
        )),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {

          setState(() {
           imagemSelecionada[0] = Random().nextInt(3) -1;  
          });        
          
        },
        child: Icon(Icons.catching_pokemon),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(images[imagemSelecionada[0]], width: 200, height: 200,),  
              Image.asset(images[imagemSelecionada[1]], width: 200, height: 200,),  
              Image.asset(images[imagemSelecionada[2]], width: 200, height: 200,),  
            ],
          )  
        ],
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
