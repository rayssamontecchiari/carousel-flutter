import 'package:flutter/material.dart';
import 'package:my_first_app/slide_file.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;

  var _listSlide = [
    {
      "id": 0,
      "image": "assets/images/img1.jpg",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    },
    {
      "id": 1,
      "image": "assets/images/img2.jpg",
      "description":
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. "
    },
    {
      "id": 2,
      "image": "assets/images/img3.jpg",
      "description":
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo."
    }
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page?.round() ?? 0;

      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: PageView.builder(
          controller: _pageController,
          itemCount: _listSlide.length,
          itemBuilder: (_, int currentIndex) {
            bool activePage = currentIndex == _currentPage;

            String currentImage = _listSlide[currentIndex]["image"].toString();
            String currentDescription =
                _listSlide[currentIndex]["description"].toString();
            return SlidePage(
                activePage: activePage,
                image: currentImage,
                imageDescription: currentDescription);
          },
        )),
        _buildBullets()
      ],
    )));
  }

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((i) {
          return InkWell(
              onTap: () {
                setState(() {
                  _pageController.jumpToPage(i['id'] as int);
                  _currentPage = i['id'] as int;
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _currentPage == i['id'] ? Colors.red : Colors.grey),
              ));
        }).toList(),
      ),
    );
  }
}
