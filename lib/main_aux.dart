import 'dart:convert';

import 'package:dogs/BreedImage.dart';
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

// Map<dynamic, dynamic> fetch1(){}
// Future<Map> fetch2() async{
//   var url = 'https://dog.ceo/api/breeds/list/all';
//   var response = await http.get(Uri.parse(url));
//   Map json = jsonDecode(response.body);
//   return json;
// }




// Future main() async {
//   final json = await fetch();
//   print(json);
// }

// var myMap =  fetch();
//
// Map myMap2 = myMap;

// void main(){
//
//   Map myMap = {
//     "message": {
//       "affenpinscher": [],
//       "african": [],
//       "airedale": [],
//       "akita": [],
//       "appenzeller": [],
//       "australian": [
//         "shepherd"
//       ],
//       "basenji": [],
//       "beagle": [],
//       "bluetick": [],
//       "borzoi": [],
//       "bouvier": [],
//       "boxer": [],
//       "brabancon": [],
//       "briard": [],
//       "buhund": [
//         "norwegian"
//       ],
//       "bulldog": [
//         "boston",
//         "english",
//         "french"
//       ],
//       "bullterrier": [
//         "staffordshire"
//       ],
//       "cattledog": [
//         "australian"
//       ],
//       "chihuahua": [],
//       "chow": [],
//       "clumber": [],
//       "cockapoo": [],
//       "collie": [
//         "border"
//       ],
//       "coonhound": [],
//       "corgi": [
//         "cardigan"
//       ],
//       "cotondetulear": [],
//       "dachshund": [],
//       "dalmatian": [],
//       "dane": [
//         "great"
//       ],
//       "deerhound": [
//         "scottish"
//       ],
//       "dhole": [],
//       "dingo": [],
//       "doberman": [],
//       "elkhound": [
//         "norwegian"
//       ],
//       "entlebucher": [],
//       "eskimo": [],
//       "finnish": [
//         "lapphund"
//       ],
//       "frise": [
//         "bichon"
//       ],
//       "germanshepherd": [],
//       "greyhound": [
//         "italian"
//       ],
//       "groenendael": [],
//       "havanese": [],
//       "hound": [
//         "afghan",
//         "basset",
//         "blood",
//         "english",
//         "ibizan",
//         "plott",
//         "walker"
//       ],
//       "husky": [],
//       "keeshond": [],
//       "kelpie": [],
//       "komondor": [],
//       "kuvasz": [],
//       "labradoodle": [],
//       "labrador": [],
//       "leonberg": [],
//       "lhasa": [],
//       "malamute": [],
//       "malinois": [],
//       "maltese": [],
//       "mastiff": [
//         "bull",
//         "english",
//         "tibetan"
//       ],
//       "mexicanhairless": [],
//       "mix": [],
//       "mountain": [
//         "bernese",
//         "swiss"
//       ],
//       "newfoundland": [],
//       "otterhound": [],
//       "ovcharka": [
//         "caucasian"
//       ],
//       "papillon": [],
//       "pekinese": [],
//       "pembroke": [],
//       "pinscher": [
//         "miniature"
//       ],
//       "pitbull": [],
//       "pointer": [
//         "german",
//         "germanlonghair"
//       ],
//       "pomeranian": [],
//       "poodle": [
//         "miniature",
//         "standard",
//         "toy"
//       ],
//       "pug": [],
//       "puggle": [],
//       "pyrenees": [],
//       "redbone": [],
//       "retriever": [
//         "chesapeake",
//         "curly",
//         "flatcoated",
//         "golden"
//       ],
//       "ridgeback": [
//         "rhodesian"
//       ],
//       "rottweiler": [],
//       "saluki": [],
//       "samoyed": [],
//       "schipperke": [],
//       "schnauzer": [
//         "giant",
//         "miniature"
//       ],
//       "setter": [
//         "english",
//         "gordon",
//         "irish"
//       ],
//       "sheepdog": [
//         "english",
//         "shetland"
//       ],
//       "shiba": [],
//       "shihtzu": [],
//       "spaniel": [
//         "blenheim",
//         "brittany",
//         "cocker",
//         "irish",
//         "japanese",
//         "sussex",
//         "welsh"
//       ],
//       "springer": [
//         "english"
//       ],
//       "stbernard": [],
//       "terrier": [
//         "american",
//         "australian",
//         "bedlington",
//         "border",
//         "cairn",
//         "dandie",
//         "fox",
//         "irish",
//         "kerryblue",
//         "lakeland",
//         "norfolk",
//         "norwich",
//         "patterdale",
//         "russell",
//         "scottish",
//         "sealyham",
//         "silky",
//         "tibetan",
//         "toy",
//         "welsh",
//         "westhighland",
//         "wheaten",
//         "yorkshire"
//       ],
//       "tervuren": [],
//       "vizsla": [],
//       "waterdog": [
//         "spanish"
//       ],
//       "weimaraner": [],
//       "whippet": [],
//       "wolfhound": [
//         "irish"
//       ]
//     },
//     "status": "success"
//   };
//
//
//   print(myMap);
//
//   Map myMap2 = myMap['message'];



// // FUNCIONOU LISTA DE VALORES
// var chaves = myMap2.entries.map((e){
//   return e.key;
// }).toList();
// // print(chaves[15]);
//
// // FUNCIONOU LISTA DE VALORES
// var valores = myMap2.entries.map((e){
//   return e.value;
// }).toList();
// // print(valores[15]);
//
// // FUNCIONOU
// var temp = valores[15];
// // print(temp.length);
//
// // print(valores.length);
//
// var dogs1 = [];
//
// for(int i=0; i<chaves.length;i++){
//   // print("teste");
//   Dog dog = new Dog(chaves[i],valores[i]);
//   dogs1.add(dog);
// }
// print(dogs1);
// }

// Future<Map<String, List<String>>> getMap() async {
//   const url = 'https://dog.ceo/api/breeds/list/all';
//   final response = await http.get(Uri.parse(url));
//   final json = jsonDecode(response.body);
//   final Map<String, dynamic> message = json['message'];
//   final mappedJson = message.map((key, value){
//     final dynamicList = value as List;
//     final stringList = dynamicList.map((e) => e as String).toList();
//     return MapEntry(key, stringList);
//   });
//   return mappedJson;
// }

// Future<List<Dog>> getDogs() async {
//   const url = 'https://dog.ceo/api/breeds/list/all';
//   final response = await http.get(Uri.parse(url));
//   final json = jsonDecode(response.body);
//   final Map<String, dynamic> message = json['message'];
//   final mappedJson = message.map((key, value){
//     final dynamicList = value as List;
//     final stringList = dynamicList.map((e) => e as String).toList();
//     return MapEntry(key, stringList);
//   });
//
//   List<Dog> dogs = [];
//   var chaves = mappedJson.entries.map((e){
//     return e.key;
//   }).toList();
//
//   var valores = mappedJson.entries.map((e){
//     return e.value;
//   }).toList();
//
//
//   for(int i=0; i<chaves.length; i++){
//     if(valores[i].length == 0){
//       String chaveTemp = chaves[i];
//       String valorTemp = "";
//       Dog dog = new Dog(chaveTemp, valorTemp);
//       dogs.add(dog);
//     }else{
//       String chaveTemp2 = chaves[i];
//       var valortemp2 = valores[i];
//       for(int j=0; j<valortemp2.length; j++){
//         String valortemp3 = valortemp2[j];
//         Dog dog = new Dog(chaveTemp2, valortemp3);
//         dogs.add(dog);
//       }
//     }
//   }
//   // for (var d in mappedJson){
//   //   Dog dog = Dog(d.key, d.value);
//   //   dogs.add(dog);
//   // }
//
//   // print(dogs.length);
//   return dogs;
// }


//descobrir com retornar um future dentro de um widget



// Future main() async {
//   final json = await getMap();
//   print(json);
// }

// Future main() async {
//   final json = await getDogs();
//   print(json.length);
// }

// for (var d in mappedJson){
//   Dog dog = Dog(d.key, d.value);
//   dogs.add(dog);
// }

// print(dogs.length);

// String urlImageApi = "";
// _getImage() async {
//   final result = await appInfoApi.getLogoClient();
//   setState(() {
//     urlImageApi = result;
//   });
// }
//
// @override
// void initState() {
//   super.initState();
//   _getImage();
// }
//
//
//
//
//
// appInfoApi.getLogoClient().then((String result){
//   setState(() {
//     urlImageApi = result;
//   });
// });
//
//
//
// then((String result){setState(() {urlImageApi = result;} ); })



// onTap: () async {
// // onTap: () {
// if (snapshot.data[index].breedComplement == "") {
//
// Future<String> getUrlImageFuture(Dog dog) async {
// var url = 'https://dog.ceo/api/breed/' + snapshot.data[index].breed  + '/images/random';
// final response = await http.get(Uri.parse(url));
// final json = jsonDecode(response.body);
// String urlImage = json['message'];
// return urlImage;
// }
// //
// //   snapshot.data[index].imageUrl = "https://images.dog.ceo/breeds/ridgeback-rhodesian/n02087394_7418.jpg";
//
// // snapshot.data[index].imageUrl = BreedImage.getUrlStringTest(snapshot.data[index]);
//
// snapshot.data[index].imageUrl = await getUrlImageFuture(snapshot.data[index]);
// // snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture(snapshot.data[index]);
//
// // snapshot.data[index].imageUrl = BreedImage.getUrlImageFuture(snapshot.data[index]).then((String result){snapshot.data[index].imageUrl = result;  });
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => BreedImage(
// breedImageModel: snapshot.data[index],
// )));
// }else{
//
// Future<String> getUrlImageFuture2(Dog dog) async {
// var url = 'https://dog.ceo/api/breed/' + snapshot.data[index].breed + '/' + snapshot.data[index].breedComplement + '/images/random';
// final response = await http.get(Uri.parse(url));
// final json = jsonDecode(response.body);
// String urlImage2 = json['message'];
// return urlImage2;
// }
// //
// //   snapshot.data[index].imageUrl = "https://images.dog.ceo/breeds/setter-gordon/n02101006_3938.jpg";
//
// // snapshot.data[index].imageUrl = BreedImage.getUrlStringTest2(snapshot.data[index]);
//
//
// snapshot.data[index].imageUrl = await getUrlImageFuture2(snapshot.data[index]);
// // snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture2(snapshot.data[index]);
//
// // snapshot.data[index].imageUrl = BreedImage.getUrlImageFuture2(snapshot.data[index]).then((String result){snapshot.data[index].imageUrl = result;  });
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => BreedImage(
// breedImageModel: snapshot.data[index],
// )));
// }
// }








  // Future<List<Dog>> getDogs() async {
  //   const url = 'https://dog.ceo/api/breeds/list/all';
  //   final response = await http.get(Uri.parse(url));
  //   final json = jsonDecode(response.body);
  //   final Map<String, dynamic> message = json['message'];
  //   final mappedJson = message.map((key, value) {
  //     final dynamicList = value as List;
  //     final stringList = dynamicList.map((e) => e as String).toList();
  //     return MapEntry(key, stringList);
  //   });
  //
  //   List<Dog> dogs = [];
  //   var keys = mappedJson.entries.map((e) {
  //     return e.key;
  //   }).toList();
  //
  //
  //   var values = mappedJson.entries.map((e) {
  //     return e.value;
  //   }).toList();
  //
  //   for (int i = 0; i < keys.length; i++) {
  //     if (values[i].length == 0) {
  //       String keyTemp = keys[i];
  //       String valueTemp = "";
  //
  //
  //       var url2 = "https://dog.ceo/api/breed/" + keyTemp + "/images/random";
  //       var response2 = await http.get(Uri.parse(url2));
  //       var json2 = jsonDecode(response2.body);
  //       List<String> images = [];
  //       images = json2['message'];
  //       // final mappedJson2 = message.map((key, value) {
  //       //   final dynamicList = value as List;
  //       //   final stringList = dynamicList.map((e) => e as String).toList();
  //       //   return MapEntry(key, stringList);
  //       // });
  //
  //       // var chaves2 = mappedJson.entries.map((e) {
  //       //   return e.key;
  //       // }).toList();
  //
  //       String imageUrl2 = images[0];
  //
  //       Dog dog = new Dog(keyTemp, valueTemp, imageUrl2);
  //       dogs.add(dog);
  //     } else {
  //       String keyTemp2 = keys[i];
  //       var valueTemp2 = values[i];
  //       for (int j = 0; j < valueTemp2.length; j++) {
  //         String valueTemp3 = valueTemp2[j];
  //
  //
  //         var url3 = "https://dog.ceo/api/breed/" + keys[i] + "/" + valueTemp2[j] + "/images";
  //         var response3 = await http.get(Uri.parse(url3));
  //         var json3 = jsonDecode(response3.body);
  //         List<String> images2 = [];
  //         images2 = json3['message'];
  //         // final mappedJson3 = message.map((key, value) {
  //         //   final dynamicList = value as List;
  //         //   final stringList = dynamicList.map((e) => e as String).toList();
  //         //   return MapEntry(key, stringList);
  //         // });
  //
  //         // var chaves3 = mappedJson.entries.map((e) {
  //         //   return e.key;
  //         // }).toList();
  //
  //         String imageUrl3 = images2[0];
  //
  //         Dog dog = new Dog(keyTemp2, valueTemp3, imageUrl3);
  //         dogs.add(dog);
  //       }
  //     }
  //   }
  //
  //   return dogs;
  // }





//   setState((){});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Breeds'),
//       ),
//       body: Container(
//         child: FutureBuilder(
//           future: getDogs(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Container(child: const Center(child: Text("Loading...")));
//             } else {
//               return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       title: Text(
//                         snapshot.data[index].breedComplement,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 15,
//                         ),
//                       ),
//                       subtitle: Text(
//                         snapshot.data[index].breed,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 15,
//                         ),
//                       ),
//                       onTap: () async {
//                         setState((){});
//                         // onTap: () {
//                         if (snapshot.data[index].breedComplement == "") {
//
//                           //
//                           //   snapshot.data[index].imageUrl = "https://images.dog.ceo/breeds/ridgeback-rhodesian/n02087394_7418.jpg";
//
//                           // snapshot.data[index].imageUrl = BreedImage.getUrlStringTest(snapshot.data[index]);
//                           snapshot.data[index].imageUrl(await BreedImage.getUrlImageFuture(snapshot.data[index]));
//
//
//                           // snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture(snapshot.data[index]);
//
//                           // snapshot.data[index].imageUrl = BreedImage.getUrlImageFuture(snapshot.data[index]).then((String result){snapshot.data[index].imageUrl = result;  });
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => BreedImage(
//                                 breedImageModel: snapshot.data[index],
//                               )));
//                         }else{
//
//
//                           //
//                           //   snapshot.data[index].imageUrl = "https://images.dog.ceo/breeds/setter-gordon/n02101006_3938.jpg";
//
//                           // snapshot.data[index].imageUrl = BreedImage.getUrlStringTest2(snapshot.data[index]);
//                           snapshot.data[index].imageUrl(await BreedImage.getUrlImageFuture2(snapshot.data[index]));
//
//
//                           // snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture2(snapshot.data[index]);
//
//                           // snapshot.data[index].imageUrl = BreedImage.getUrlImageFuture2(snapshot.data[index]).then((String result){snapshot.data[index].imageUrl = result;  });
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => BreedImage(
//                                 breedImageModel: snapshot.data[index],
//                               )));
//                         }
//                       },
//                     );
//                   });
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
//
// // class ImageBreed extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }




// @override
// BreedsList createState() => BreedsList();

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       body: BreedsList(),
//     ),
//   );
// }

// setState((){});






// class BreedsList extends State<DogsApp> {
//   // const DogsList({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Breeds'),
//       ),
//       body: Container(
//         child: FutureBuilder(
//           future: getDogs(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Container(child: const Center(child: Text("Loading...")));
//             } else {
//               return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       title: Text(
//                         snapshot.data[index].breedComplement,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 15,
//                         ),
//                       ),
//                       subtitle: Text(
//                         snapshot.data[index].breed,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 15,
//                         ),
//                       ),
//                       onTap: () async {
//                         // onTap: () {
//                         setState((){});
//                         if (snapshot.data[index].breedComplement == "") {
//
//                           //
//                           //   snapshot.data[index].imageUrl = "https://images.dog.ceo/breeds/ridgeback-rhodesian/n02087394_7418.jpg";
//
//                           // snapshot.data[index].imageUrl = BreedImage.getUrlStringTest(snapshot.data[index]);
//                           snapshot.data[index].imageUrl(await BreedImage.getUrlImageFuture(snapshot.data[index]));
//
//
//                           // snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture(snapshot.data[index]);
//
//                           // snapshot.data[index].imageUrl = BreedImage.getUrlImageFuture(snapshot.data[index]).then((String result){snapshot.data[index].imageUrl = result;  });
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => BreedImage(
//                                 breedImageModel: snapshot.data[index],
//                               )));
//                         }else{
//
//
//                           //
//                           //   snapshot.data[index].imageUrl = "https://images.dog.ceo/breeds/setter-gordon/n02101006_3938.jpg";
//
//                           // snapshot.data[index].imageUrl = BreedImage.getUrlStringTest2(snapshot.data[index]);
//                           snapshot.data[index].imageUrl(await BreedImage.getUrlImageFuture2(snapshot.data[index]));
//
//
//                           // snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture2(snapshot.data[index]);
//
//                           // snapshot.data[index].imageUrl = BreedImage.getUrlImageFuture2(snapshot.data[index]).then((String result){snapshot.data[index].imageUrl = result;  });
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => BreedImage(
//                                 breedImageModel: snapshot.data[index],
//                               )));
//                         }
//                       },
//                     );
//                   });
//             }
//           },
//         ),
//       ),
//     )
//     );
//
//
//
//   }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Breeds'),
//     ),
//     body: Container(
//       child: FutureBuilder(
//         future: getDogs(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.data == null) {
//             return Container(child: const Center(child: Text("Loading...")));
//           } else {
//             return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text(
//                       snapshot.data[index].breedComplement,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w300,
//                         fontSize: 15,
//                       ),
//                     ),
//                     subtitle: Text(
//                       snapshot.data[index].breed,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w300,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () async {
//                       // onTap: () {
//                       setState((){});
//                       if (snapshot.data[index].breedComplement == "") {
//
//                         //
//                         //   snapshot.data[index].imageUrl = "https://images.dog.ceo/breeds/ridgeback-rhodesian/n02087394_7418.jpg";
//
//                         // snapshot.data[index].imageUrl = BreedImage.getUrlStringTest(snapshot.data[index]);
//                         snapshot.data[index].imageUrl(await BreedImage.getUrlImageFuture(snapshot.data[index]));
//
//
//                         // snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture(snapshot.data[index]);
//
//                         // snapshot.data[index].imageUrl = BreedImage.getUrlImageFuture(snapshot.data[index]).then((String result){snapshot.data[index].imageUrl = result;  });
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => BreedImage(
//                               breedImageModel: snapshot.data[index],
//                             )));
//                       }else{
//
//
//                         //
//                         //   snapshot.data[index].imageUrl = "https://images.dog.ceo/breeds/setter-gordon/n02101006_3938.jpg";
//
//                         // snapshot.data[index].imageUrl = BreedImage.getUrlStringTest2(snapshot.data[index]);
//                         snapshot.data[index].imageUrl(await BreedImage.getUrlImageFuture2(snapshot.data[index]));
//
//
//                         // snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture2(snapshot.data[index]);
//
//                         // snapshot.data[index].imageUrl = BreedImage.getUrlImageFuture2(snapshot.data[index]).then((String result){snapshot.data[index].imageUrl = result;  });
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => BreedImage(
//                               breedImageModel: snapshot.data[index],
//                             )));
//                       }
//                     },
//                   );
//                 });
//           }
//         },
//       ),
//     ),
//   );
// }

// Future<List<Dog>> getDogs() async {
//   const url = 'https://dog.ceo/api/breeds/list/all';
//   final response = await http.get(Uri.parse(url));
//   final json = jsonDecode(response.body);
//   final Map<String, dynamic> message = json['message'];
//   final mappedJson = message.map((key, value) {
//     final dynamicList = value as List;
//     final stringList = dynamicList.map((e) => e as String).toList();
//     return MapEntry(key, stringList);
//   });
//
//   List<Dog> dogs = [];
//   var keys = mappedJson.entries.map((e) {
//     return e.key;
//   }).toList();
//
//   var values = mappedJson.entries.map((e) {
//     return e.value;
//   }).toList();
//
//   for (int i = 0; i < keys.length; i++) {
//     if (values[i].length == 0) {
//       String keyTemp = keys[i];
//       String valueTemp = "";
//       String imageUrl = "teste";
//       Dog dog = new Dog(keyTemp, valueTemp, imageUrl);
//       dogs.add(dog);
//     } else {
//       String keyTemp2 = keys[i];
//       var valueTemp2 = values[i];
//       for (int j = 0; j < valueTemp2.length; j++) {
//         String valueTemp3 = valueTemp2[j];
//         String imageUrl = "teste";
//         Dog dog = new Dog(keyTemp2, valueTemp3, imageUrl);
//         dogs.add(dog);
//       }
//     }
//   }
//
//   return dogs;
// }
// }



// Future<List<Dog>> getDogs() async {
//   const url = 'https://dog.ceo/api/breeds/list/all';
//   final response = await http.get(Uri.parse(url));
//   final json = jsonDecode(response.body);
//   final Map<String, dynamic> message = json['message'];
//   final mappedJson = message.map((key, value) {
//     final dynamicList = value as List;
//     final stringList = dynamicList.map((e) => e as String).toList();
//     return MapEntry(key, stringList);
//   });
//
//   List<Dog> dogs = [];
//   var keys = mappedJson.entries.map((e) {
//     return e.key;
//   }).toList();
//
//
//   var values = mappedJson.entries.map((e) {
//     return e.value;
//   }).toList();
//
//   for (int i = 0; i < keys.length; i++) {
//     if (values[i].length == 0) {
//       String keyTemp = keys[i];
//       String valueTemp = "";
//
//
//       var url2 = "https://dog.ceo/api/breed/" + keyTemp + "/images/random";
//       var response2 = await http.get(Uri.parse(url2));
//       var json2 = jsonDecode(response2.body);
//       List<String> images = [];
//       images = json2['message'];
//       // final mappedJson2 = message.map((key, value) {
//       //   final dynamicList = value as List;
//       //   final stringList = dynamicList.map((e) => e as String).toList();
//       //   return MapEntry(key, stringList);
//       // });
//
//       // var chaves2 = mappedJson.entries.map((e) {
//       //   return e.key;
//       // }).toList();
//
//       String imageUrl2 = images[0];
//
//       Dog dog = new Dog(keyTemp, valueTemp, imageUrl2);
//       dogs.add(dog);
//     } else {
//       String keyTemp2 = keys[i];
//       var valueTemp2 = values[i];
//       for (int j = 0; j < valueTemp2.length; j++) {
//         String valueTemp3 = valueTemp2[j];
//
//
//         var url3 = "https://dog.ceo/api/breed/" + keys[i] + "/" + valueTemp2[j] + "/images";
//         var response3 = await http.get(Uri.parse(url3));
//         var json3 = jsonDecode(response3.body);
//         List<String> images2 = [];
//         images2 = json3['message'];
//         // final mappedJson3 = message.map((key, value) {
//         //   final dynamicList = value as List;
//         //   final stringList = dynamicList.map((e) => e as String).toList();
//         //   return MapEntry(key, stringList);
//         // });
//
//         // var chaves3 = mappedJson.entries.map((e) {
//         //   return e.key;
//         // }).toList();
//
//         String imageUrl3 = images2[0];
//
//         Dog dog = new Dog(keyTemp2, valueTemp3, imageUrl3);
//         dogs.add(dog);
//       }
//     }
//   }
//
//   return dogs;
// }




// class ImageBreed extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }