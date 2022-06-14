import 'package:flutter/material.dart';

class Tela extends StatefulWidget {
  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double?.parse(_controllerAlcool.text);
    double? precoGasolina = double?.parse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, use o ponto (.) e numeros maiores que 0";
      });
      print("numero nulo");
    } else {
      setState(() {
        _textoResultado = "Número válido, realize o cálculo";
      });
    }

    /* Se preço do álcool/ preço da gasolina >= 0,7, é melhor 
      usar gasolina, senão, melhor usar álcool*/

    if ((precoAlcool / precoGasolina) >= 0.7) {
      setState(() {
        _textoResultado = "É melhor usar Gasolina! 😁";
      });
    } else {
      setState(() {
        _textoResultado = "É melhor usar Álcool! 😮";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 233, 145, 31),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.airport_shuttle_rounded),
              SizedBox(
                width: 30,
              ),
              Text("Qual combustível usar?"),
            ],
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            //⚠️Esse incrmento faz com que o scroll seja possível, logo, é possível rolar a tela para baixo e para cima😮⚠️
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Imagem Logo:
                Padding(
                  padding:
                      EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 5),
                  child: Image.asset("imagens/logo.png"),
                ),

                //Parágrafo base:
                Padding(
                  padding:
                      EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
                  child: Text(
                    "Descubra qual opção mais viável para abastecer seu veículo:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //Primeira caixa de Texto:
                Padding(
                  padding:
                      EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border:
                          OutlineInputBorder(), //cria as 4 bordas do TextField
                      prefixIcon: Icon(Icons
                          .monetization_on_outlined), //cria um ícone de dinheiro no lado esquerdo do TextField
                      suffix: Text(
                        "Reais", //create a text in end of TextField
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      labelText: "Preço Gasolina, Ex: 3.59",
                    ),
                    maxLength: 4, //define a quantidade de caracteres
                    textAlign: TextAlign
                        .center, //o input do usuário será colocado ao centro do Field
                    style: TextStyle(
                      fontSize: 21,
                      color: Color.fromARGB(255, 233, 145, 31), //cor da fonte
                    ),

                    controller:
                        _controllerGasolina, // realiza o controle do que o usuário digita no TextField
                  ),
                ),

                //Segunda caixa de texto:
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 5),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        suffix: Text(
                          "Reais",
                          style: TextStyle(fontSize: 15),
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Preço Álcool, Ex: 2.80"),
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      color: Color.fromARGB(255, 233, 145, 31),
                    ),
                    controller: _controllerAlcool,
                  ),
                ),

                //Botão:
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 0),
                  child: TextButton(
                    onPressed: _calcular,
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 233, 145, 31),
                      elevation: 15,
                      shadowColor: Colors.purple,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.check),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Calcular',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 255, 254, 254)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //RESULTADO:
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
