import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         stops: [0.3, 1],
        //         colors: [
        //           Color(0xf556677b),
        //           Colors.white,
        //         ])
        // ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              TopBar(),
              
              Spacer(),
              
              ChooseTypes(),

              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Let\'s split the',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF56677b),
                ),
              ),


              Text(
                'Bills',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF56677b),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset('assets/images/receipt.png'),
          )
        ],
      ),
    );
  }
}

class ChooseTypes extends StatelessWidget {
  const ChooseTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        DividerBox(
            image: 'assets/images/divided_evenly.png',
            title: 'Divide Evenly'
        ),

        SizedBox(height: 30),

        DividerBox(
          image: 'assets/images/divided_unevenly.png',
          title: 'Divide UnEvenly'
        )
      ],
    );
  }
}

class DividerBox extends StatelessWidget {
  final String image;
  final String title;


  const DividerBox({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
        borderRadius:  BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(3, 10), // changes position of shadow
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              image,
          ),

          Text(
            title,
            style: const TextStyle(
              color: Color(0xff56677b),
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}
