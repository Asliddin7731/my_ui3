import 'package:flutter/material.dart';
import 'package:my_ui3/pages/HomePage.dart';
import 'package:my_ui3/utils/Strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  static const String id = 'IntroPage';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0 );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller: pageController,
            children: [
              makePage('assets/images/image_1.png', Strings.stepOneTitle, Strings.stepOneContent),
              makePage('assets/images/image_2.png', Strings.stepTwoTitle, Strings.stepTwoContent),
              makePage('assets/images/image_3.png', Strings.stepThreeTitle, Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildIndicator(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 40, bottom: 50),
            alignment: Alignment.bottomRight,
            child: skip(),
          )
        ],
      ),
    );
  }

  Widget makePage (image, title, context, ){
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          const SizedBox(
            height: 190,
          ),
          Text(title, style: const TextStyle(
              color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
          Text(
            context,textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset( image),
          ),
        ],
      ),
    );

  }
  Widget indicator (bool isActive){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
    height: 6,
      margin: const EdgeInsets.only(right: 5),
      width: isActive ? 30 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.red,
      ),
    );
  }
 List <Widget> buildIndicator (){
    List<Widget> indicators = [];
      for (int i = 0; i < 3; i++){
        if (currentIndex == i){
          indicators.add(indicator(true));
        } else {
          indicators.add(indicator(false));
        }
      }
    return indicators;

 }

 Widget skip (){
    String skip='';
  if (currentIndex == 2){
   skip = 'skip';
  }

    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, HomePage.id);
      },
      child: Text(skip),
    );
}
}
