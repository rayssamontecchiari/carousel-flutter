import 'package:flutter/material.dart';
import 'images_detalhes.dart';

class SlidePage extends StatefulWidget {
  final String image;
  final String imageDescription;
  final bool activePage;

  SlidePage(
      {Key? key,
      required this.image,
      required this.activePage,
      required this.imageDescription})
      : super(key: key);

  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  @override
  Widget build(BuildContext context) {
    String image = widget.image;
    String imageDescription = widget.imageDescription;
    bool activePage = widget.activePage;

    final double top = (activePage) ? 50 : 100;
    final double blur = (activePage) ? 30 : 0;
    final double offset = (activePage) ? 20 : 0;

    return InkWell(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ImageDetailsPage(
                        imageSelected: image,
                        imageDescription: imageDescription),
                  ))
            },
        child: AnimatedContainer(
          duration: Duration(microseconds: 1500),
          curve: Curves.easeInOutQuint,
          margin: EdgeInsets.only(top: top, bottom: 40, right: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.black87,
                    blurRadius: blur,
                    offset: Offset(offset, offset))
              ]),
        ));
  }
}
