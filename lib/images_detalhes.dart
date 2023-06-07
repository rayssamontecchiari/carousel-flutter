import 'package:flutter/material.dart';

class ImageDetailsPage extends StatelessWidget {
  final String imageSelected;
  final String imageDescription;

  ImageDetailsPage(
      {Key? key, required this.imageSelected, required this.imageDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mais detalhes da imagem.."),
        ),
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(imageSelected), fit: BoxFit.cover),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 200,
                ),
                child: Wrap(children: [
                  Text(
                    imageDescription,
                  )
                ]),
              )
            ]))));
  }
}
