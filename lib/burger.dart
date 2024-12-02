import 'package:flutter/material.dart';

List<Burger> burgers = [
  Burger('Beef Burger', 7),
  Burger('Cheese Burger', 8),
  Burger('Chicken Burger', 6)
];

class Burger {
  String burgerType;
  double price;
  double delivery = 2.0;
  bool fries = false;
  bool cola = false;
  bool dips = false;

  Burger(this.burgerType, this.price);

  @override
  String toString() {
    return '$burgerType (price: \$$price)';
  }

  String getTotalPrice() {
    double deliveryAmount = 2.0;
    if (delivery == 2.0) {
      if (fries && cola && dips)
        return (price + 2 + 1 + 1 + deliveryAmount).toStringAsFixed(0);
      else if (fries && cola || fries && dips)
        return (price + 2 + 1 + deliveryAmount).toStringAsFixed(0);
      else if (cola && dips)
        return (price + 1 + 1 + deliveryAmount).toStringAsFixed(0);
      else if (fries)
        return (price + 2 + deliveryAmount).toStringAsFixed(0);
      else if (cola)
        return (price + 1 + deliveryAmount).toStringAsFixed(0);
      else if (dips)
        return (price + 1 + deliveryAmount).toStringAsFixed(0);
      else
        return (price + deliveryAmount).toStringAsFixed(0);
    }
    else {
      if (fries && cola && dips)
        return (price + 2 + 1 + 1).toStringAsFixed(0);
      else if (fries && cola || fries && dips)
        return (price + 2 + 1).toStringAsFixed(0);
      else if (cola && dips)
        return (price + 1 + 1).toStringAsFixed(0);
      else if (fries)
        return (price + 2).toStringAsFixed(0);
      else if (cola)
        return (price + 1).toStringAsFixed(0);
      else if (dips)
        return (price + 1).toStringAsFixed(0);
      else
        return (price).toStringAsFixed(0);
    }
  }
}

class MyDropDownMenuWidget extends StatefulWidget {
  const MyDropDownMenuWidget({required this.updateBurger, super.key});
  final Function(Burger) updateBurger;

  @override
  State<MyDropDownMenuWidget> createState() => _MyDropDownMenuWidgetState();
}

class _MyDropDownMenuWidgetState extends State<MyDropDownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 260.0,
        initialSelection: burgers[0],
        onSelected: (burger){
          setState(() {
            widget.updateBurger(burger as Burger);
          });
        },
        dropdownMenuEntries: burgers.map<DropdownMenuEntry<Burger>>((Burger burger){
          return DropdownMenuEntry(value: burger, label: burger.toString());
        }).toList()
    );
  }
}

class DeliveryWidget extends StatefulWidget {
  final Burger burger;
  final Function(double) updateDelivery;
  const DeliveryWidget({required this.burger, required this.updateDelivery, super.key});

  @override
  State<DeliveryWidget> createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  double _amount = 2.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, children: [
      Radio(value: 2.0, groupValue: widget.burger.delivery, onChanged: (val){
        setState(() {
          _amount = val as double;
          widget.updateDelivery(_amount);
        });
      }),
      const Text('Delivery(\$2)      ', style: TextStyle(fontSize: 18.0),),
      Radio(value: 0, groupValue: widget.burger.delivery, onChanged: (val){
        setState(() {
          _amount = val as double;
          widget.updateDelivery(_amount);
        });
      }),
      const Text('Take Away', style: TextStyle(fontSize: 18.0),),
      ],
    );
  }
}

