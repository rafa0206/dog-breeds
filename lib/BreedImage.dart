import 'package:flutter/material.dart';

import 'Dog.dart';

import 'main.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;


class BreedImage extends StatefulWidget {
  final Dog breedImageModel;
  // final Function callBackFunction;
  const BreedImage({Key? key, required this.breedImageModel}) : super(key: key);

  static Future<String> getUrlImageFuture(Dog dog) async {
    var url = 'https://dog.ceo/api/breed/' + dog.breed + '/images/random';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    String urlImage = json['message'];
    return urlImage;
  }


  static Future<String> getUrlImageFuture2(Dog dog) async {
    var url = 'https://dog.ceo/api/breed/' + dog.breed + '/' + dog.breedComplement + '/images/random';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    String urlImage2 = json['message'];
    return urlImage2;
  }



  @override
  Widget build(BuildContext context) {
    // setState((){});
    return Scaffold(
      appBar: AppBar(title: Text(breedImageModel.breed),),
      body: Column(
        children: [
          Image.network(breedImageModel.imageUrl),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
