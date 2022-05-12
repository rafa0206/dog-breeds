import 'dart:convert';

import 'package:dogs/BreedImage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:async';

import 'package:dogs/Dog.dart';


void main() => runApp(DogsApp());

class DogsApp extends StatelessWidget {
  const DogsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BreedsList(),
      ),
    );
  }
}

class BreedsList extends StatelessWidget {
  // const DogsList({Key? key}) : super(key: key);

  Future<List<Dog>> getDogs() async {
    const url = 'https://dog.ceo/api/breeds/list/all';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    final Map<String, dynamic> message = json['message'];
    final mappedJson = message.map((key, value) {
      final dynamicList = value as List;
      final stringList = dynamicList.map((e) => e as String).toList();
      return MapEntry(key, stringList);
    });

    List<Dog> dogs = [];
    var keys = mappedJson.entries.map((e) {
      return e.key;
    }).toList();

    var values = mappedJson.entries.map((e) {
      return e.value;
    }).toList();

    for (int i = 0; i < keys.length; i++) {
      if (values[i].length == 0) {
        String keyTemp = keys[i];
        String valueTemp = "";
        String imageUrl = "";
        Dog dog = new Dog(keyTemp, valueTemp, imageUrl);
        dogs.add(dog);
      } else {
        String keyTemp2 = keys[i];
        var valueTemp2 = values[i];
        for (int j = 0; j < valueTemp2.length; j++) {
          String valueTemp3 = valueTemp2[j];
          String imageUrl = "";
          Dog dog = new Dog(keyTemp2, valueTemp3, imageUrl);
          dogs.add(dog);
        }
      }
    }

    return dogs;
  }



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breeds'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getDogs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: const Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        snapshot.data[index].breedComplement,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        snapshot.data[index].breed,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BreedImage(breedImageModel: snapshot.data[index],)));
                      },
                    );
                 }
              );
            }
          },
        ),
      ),
    );
  }
}

// class ImageBreed extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
