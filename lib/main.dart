import 'dart:convert';

import 'package:dogs/BreedImage.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:async';

import 'package:dogs/Dog.dart';

void main() => runApp(DogsApp());


class DogsApp extends StatefulWidget {

  const DogsApp({Key? key}) : super(key: key);

  @override
  State<DogsApp> createState() => _DogsAppState();
}

class _DogsAppState extends State<DogsApp> {
  // String imageUrl = "teste";
  // callBack(varImageUrl){
  //   setState(() {
  //     imageUrl = varImageUrl;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                          onTap: () async {
                          //   onTap: () {

                            if (snapshot.data[index].breedComplement == "") {
                              snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture(snapshot.data[index]);


                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BreedImage(
                                    breedImageModel: snapshot.data[index],
                                  )));
                            }else{

                              snapshot.data[index].imageUrl = await BreedImage.getUrlImageFuture2(snapshot.data[index]);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BreedImage(
                                    breedImageModel: snapshot.data[index],
                                  )));
                            }

                          },
                        );
                      });
                }
              },
            ),
          ),
        )
    );
  }

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
        String imageUrl = "teste";
        Dog dog = new Dog(keyTemp, valueTemp, imageUrl);
        dogs.add(dog);
      } else {
        String keyTemp2 = keys[i];
        var valueTemp2 = values[i];
        for (int j = 0; j < valueTemp2.length; j++) {
          String valueTemp3 = valueTemp2[j];
          String imageUrl = "teste";
          Dog dog = new Dog(keyTemp2, valueTemp3, imageUrl);
          dogs.add(dog);
        }
      }
    }

    return dogs;
  }

}


