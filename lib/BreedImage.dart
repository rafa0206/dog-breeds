import 'package:flutter/material.dart';

import 'Dog.dart';

import 'main.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class BreedImage extends StatelessWidget {
  final Dog breedImageModel;
  const BreedImage({Key? key, required this.breedImageModel}) : super(key: key);



  static Future<String> getUrlImageFuture(Dog dog) async {
    var url = 'https://dog.ceo/api/breed/' + dog.breed + '/images/random';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    String urlImage = json['message'];
    return urlImage;
  }

  static String getUrlString(Future<String> urlImage){
    String s = urlImage as String;
    return s;
  }


  static Future<String> getUrlImageFuture2(Dog dog) async {
    var url = 'https://dog.ceo/api/breed/' + dog.breed + '/' + dog.imageUrl + '/images/random';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    String urlImage2 = json['message'];
    return urlImage2;
  }

  static String getUrlString2(Future<String> urlImage2){
    String t = urlImage2 as String;
    return t;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(breedImageModel.breed),),
      body: Column(
        children: [
          Image.network(breedImageModel.imageUrl),
        ],
      ),
    );
  }
}
