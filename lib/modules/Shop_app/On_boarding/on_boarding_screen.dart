import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/modules/Shop_app/Login/Shop_login_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';



class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardControlar = PageController();

  bool isFinsh = false;

  List<BoardingModel> boardings = [
  BoardingModel(
  image: 'images/On_boarding1.png',
  title: 'On Boarding 1 Title',
  body:   'On Boarding 1 Body'),
  BoardingModel(
  image: 'images/download.png',
  title: 'On Boarding 2 Title',
  body:   'On Boarding 2 Body'),
  BoardingModel(
  image: 'images/On_boarding1.png',
  title: 'On Boarding 3 Title',
  body:   'On Boarding 3 Body'),
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    actions: [
      TextButton(
        onPressed: ()
      {
        CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
          if (value){
            navigateAndFinish(context, ShopLoginScreen());
          }
        });
         },
      child: Text('Skip' ,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),),
    ],
  ),
  body:Padding(
  padding: const EdgeInsets.all(45.0),
  child: Column(
  children: [
  Expanded(
      child: PageView.builder(
      onPageChanged: (value) {
      if(value == boardings.length-1){
      setState(() {
        isFinsh = true;
      });
    } else
      setState(() {
        isFinsh = false;
      });
  },
  controller: boardControlar,
  itemBuilder:(context,index)=>buildBoardingItem(boardings[index] ),
  itemCount: boardings.length)),
  SizedBox(height:60),
  Row(
  children: [
  SmoothPageIndicator(
  controller:boardControlar,
  count: boardings.length,
  effect: ScrollingDotsEffect(
                  spacing: 7,
                  dotColor: Colors.grey ,
                  activeDotColor: Colors.teal)),
  Spacer(),
  FloatingActionButton(onPressed: (){
    if(isFinsh ){
      CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
        if (value){
          navigateAndFinish(context, ShopLoginScreen());
        }
      });
    }else{
    boardControlar.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);}
  }, child:
  Icon(Icons.arrow_forward_rounded),),
  ],
  ),
  ],
  ),
  ),
  );
  }







  Widget buildBoardingItem(BoardingModel )=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Expanded(
  child: Image(
  image: AssetImage('${BoardingModel.image}'), ),
  ),
    SizedBox(height: 30,),
  Text('${BoardingModel.title}' , style:
  TextStyle(fontSize:  24 , fontWeight: FontWeight.bold)),
  SizedBox(height: 20,),
  Text('${BoardingModel.body}', style:
  TextStyle(fontSize:  14 , fontWeight: FontWeight.bold)),
    ],
  );
}
