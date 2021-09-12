import 'package:flutter/material.dart';

class AddPrices extends StatefulWidget {
  final int noOfPeople;
  final int noOfItems;

  const AddPrices({
    Key? key,
    required this.noOfPeople,
    required this.noOfItems,
  }) : super(key: key);

  @override
  _AddPricesState createState() => _AddPricesState();
}

class _AddPricesState extends State<AddPrices> {
  late List<dynamic> items;

  @override
  void initState() {
    super.initState();
    items = createItems(widget.noOfItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
        child: ItemList(items: items),
      ),
    );
  }

  createItems(numberOfItems) {
    var itemArray= [];
    if(numberOfItems == null) {
      return itemArray;
    }

    for(var index = 0; index < numberOfItems; index ++) {
      itemArray.add(
          {'id': index + 1, 'name': 'Item ${index + 1}', 'price': 0}
      );
    }
    return itemArray;
  }
}

class ItemList extends StatefulWidget {
  final List<dynamic> items;

  const ItemList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.items[index]['name']),
        );
      },
    );
  }
}

