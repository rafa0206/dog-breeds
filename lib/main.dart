import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() => runApp(DogsApp());

// void main() => runApp(const DogsApp());

class DogsApp extends StatelessWidget {
  // const DogsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BreedsList(),

      ),
    );
  }
}

// caso eu queira criar um botao para gerar a lista
// class BottonBreedList extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           ElevatedButton(
//               child: Text("Listar Raças"),
//               onPressed: () => _createDog()
//                 //
//                 // debugPrint("");
//                 //
//               )
//         ],
//       ),
//     );
//   }
// }

// void _createDog (){
//   // final String breed = requisiçao
//   // final String breedComplement = requisicao
//   // if (breed != null && breedComplement != null){
//   //   final dogCreate = Dog(breed, breedComplement);
//   //   debugPrint('$dogCreate');
//   // }
//   // _dogs.add(dogReceived);
// }


class BreedsList extends StatelessWidget{
  // const DogsList({Key? key}) : super(key: key);

  // final List<Dog> _dogs = List();
  final List<Dog> _dogs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breeds'),
      ),

      //talvez seja preciso usar a funcao "builder" se a lista for dinamica
      // body: ListView.builder(
      //   itemCount: _dogs.length,
      //   itemBuilder: (context, indice){
      //     final dog = _dogs[indice];
      //     return ItemBreedsList(dog);
      //   },
      //
      //   // children: <Widget>[
      //   // ItemBreedsList(Dog("Boxer", "")),
      //   // ItemBreedsList(Dog("Chow", "")),
      //   //
      //   // ],
      //
      // ),
      body: ListView(
        children: <Widget>[
        ItemBreedsList(Dog("Boxer", "")),
        ItemBreedsList(Dog("Chow", "")),
    //
      ],
      ),
    );
  }
}

class ItemBreedsList extends StatelessWidget {

  final Dog _dog;
  ItemBreedsList(this._dog);
  // const ItemDogsList(this._dog);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_dog.breed),
        subtitle: Text(_dog.breedComplement),
      ),
    );
  }
}

class Dog {
  final String breed;
  final String breedComplement;

  Dog(this.breed, this.breedComplement);
  // Dog(this.breed, {this.breedComplement});

  @override
  String toString() {
    return 'Dog{breed: $breed, breedComplement: $breedComplement}';
  }
}


//quando apertado o item da lista quero que va
//para outra tela mostrando a imagem
//para acessar a tela de imagem da raça usaremos o "Navigator.push"
//com o " MaterialPageRoute" a seta para voltar para pagina anterior já é automatica
// Navigator.push(context, MaterialPageRoute(builder: (context){
//   return ImageBreed();
// }));

class ImageBreed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


Future<Map> fetch() async{
  var url = 'https://dog.ceo/api/breeds/list/all';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  return json;
}

// Future main() async {
//   final json = await fetch();
//   print(json['message']);
// }