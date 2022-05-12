import 'package:flutter/material.dart';

import 'Dog.dart';
import 'main.dart';

class BreedImage extends StatelessWidget {
  final Dog breedImageModel;
  const BreedImage({Key? key, required this.breedImageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(breedImageModel.breed),),
      body: Column(
        children: [
          //Image.network(breedImageModel.imageUrl),
          Image.network("https://dog.ceo/api/breed/" + breedImageModel.breed + "/" + breedImageModel.breed + "/images/random")
        ],
      ),
    );
  }
}
