import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'items_price_screen.dart';

class BillDetails extends StatefulWidget {
  const BillDetails({Key? key}) : super(key: key);

  @override
  _BillDetailsState createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  int peopleCount = 0;
  int itemCount = 0;
  bool validToCalculate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.3, 1],
        colors: [
          Color(0xf556677b),
          Colors.black,
        ])
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              const SizedBox(height: 20,),

              NumberCount(type: 'People', update: countUpOrDown, count: peopleCount),

              const SizedBox(height: 20,),

              NumberCount(type: 'Items', update: countUpOrDown, count: itemCount),

              const Spacer(),

              ShowNextPage(noOfPeople: peopleCount, noOfItems: itemCount),
            ],
          ),
        ),
    ),
    );
  }

  void countUpOrDown(type, upOrDown) {
    setState(() {
      if (type == 'People') {
        upOrDown == 'up' ? peopleCount < 100 ? peopleCount ++ : {} : {};
        upOrDown == 'down' ? peopleCount > 0 ? peopleCount -- : {}: {};
      }
      if (type == 'Items') {
        upOrDown == 'up' ? itemCount < 100 ? itemCount ++ : {} : {};
         upOrDown == 'down' ? itemCount > 0 ? itemCount -- : {} : {};
      }

      validToCalculate = itemCount > 0 && peopleCount > 0 ? true : false;
    });
  }
}

class NumberCount extends StatefulWidget {
  final String type;
  final Function update;
  final int count;

  const NumberCount({
    Key? key,
    required this.type,
    required this.update,
    required this.count,
  }) : super(key: key);

  @override
  _NumberCountState createState() => _NumberCountState();
}

class _NumberCountState extends State<NumberCount> {

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
        height: 60,
        width: double.infinity,
        borderRadius: 125,
        blur: 15,
        alignment: Alignment.center,
        border: 1,
        linearGradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.white38.withOpacity(0.2)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
        ),
        borderGradient: LinearGradient(
            colors: [
              Colors.white24.withOpacity(0.2),
              Colors.white70.withOpacity(0.2)
            ]
        ),

        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(width: 15,),

              Text(
                'Number of ${widget.type}',
                style: const TextStyle(
                  fontSize: 22,
                  height: 2,
                  color: Colors.white60,
                ),
              ),

              const Spacer(),


              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      widget.update(widget.type, 'down');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.remove_outlined,
                        color: Colors.white60,
                        size: 25,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 30,
                    child: Text(
                      widget.count.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white60,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      widget.update(widget.type, 'up');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Icon(
                        Icons.add_outlined,
                        color: Colors.white60,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 15,),
            ],
        ),
      );
  }
}

class ShowNextPage extends StatefulWidget {
  final int noOfPeople;
  final int noOfItems;

  const ShowNextPage({
    Key? key,
    required this.noOfItems,
    required this.noOfPeople,
  }) : super(key: key);

  @override
  _ShowNextPageState createState() => _ShowNextPageState();
}

class _ShowNextPageState extends State<ShowNextPage> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
      children: <Widget>[
        Row(
          children: [
            const Spacer(),

            GestureDetector(
              onTap: () {
                isValid() ?
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                  AddPrices(
                      noOfPeople: widget.noOfPeople,
                      noOfItems: widget.noOfItems)
                  ),
                ) : {};
              },
              child: GlassmorphicContainer(
                height: 80,
                width: 80,
                borderRadius: 20,
                blur: 15,
                border: 1,
                linearGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white38.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white24.withOpacity(0.2),
                    Colors.white70.withOpacity(0.2)
                  ]
                ),
                child: Center(
                  child: Text(
                      (isValid() ? 'Let\'s Go' : 'Select Plz'),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30)
      ],
      ),
    );
  }

  isValid() {
    return widget.noOfItems > 0 && widget.noOfPeople > 0;
  }
}
