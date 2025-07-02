import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // isso é uma lista de texto, que contem o endereço das imagens
  List<String> images = ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'];
  List<int> imagemSelecionada = [0, 0, 0];

  //int somatoria = 0; // numero inteiro
  double somatorio = 100.0; // numero com virgula, por exemplo dinheiro

  void sortear()
  {
    int i = 0;
    while (i < 5) {
      setState(() {
        imagemSelecionada[0] = Random().nextInt(images.length);
        imagemSelecionada[1] = Random().nextInt(images.length);
        imagemSelecionada[2] = Random().nextInt(images.length);
        
      });
      
      i++; // mesma coisa que i = i +1;
    }
    if (imagemSelecionada[0] == imagemSelecionada[1] && imagemSelecionada[1] == imagemSelecionada[2]) {

      /// aqui vai somar
      somatorio = somatorio + 100.0;

      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("Parabens"),
          content: Text("voce ganhou"),  
        )
      );
    } else { // quando as imagens forem diferentes, vai entrar aqui
       somatorio = somatorio - 100.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width -30;
    final larguraImagem = larguraTela / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Baleia",
          style: TextStyle(fontSize: 30, backgroundColor: Colors.blue),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          sortear();
        },
        child: Icon(Icons.catching_pokemon),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Row( //LINHA
            mainAxisAlignment: MainAxisAlignment.center, //alinhamento
            children: [ //FILHOS
              Image.asset(
                images[imagemSelecionada[0]],
                width: larguraImagem,
                height: 200,
              ),
              SizedBox(width: 15,),
              Image.asset(
                images[imagemSelecionada[1]],
                width: larguraImagem,
                height: 200,
              ),
              SizedBox(width: 15,),
              Image.asset(
                images[imagemSelecionada[2]],
                width: larguraImagem,
                height: 200,
              ),
            ],
          ),
          Text(
            "Pontuação: " + somatorio.toString(), 
            style: TextStyle(
              fontSize: 30, // tamanho do texto
              color: Colors.black, // cor do texto
              fontWeight: FontWeight.w900, // largura do texto
              backgroundColor: Color.fromARGB(255, 255, 255, 255) /// cor do fundo
            )
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
