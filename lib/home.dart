import 'package:flutter/material.dart';
import 'burger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    String totalPrice = burgers.first.getTotalPrice();
    Burger burger = burgers.first;

    void updateBurger(Burger burger) {
      setState(() {
        this.burger = burger;
        totalPrice = burger.getTotalPrice();
      });
    }

    void updateDelivery(double delivery) {
      setState(() {
        burger.delivery = delivery;
        totalPrice = burger.getTotalPrice();
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20.0,),
              const Text('Select Burger: ', style: TextStyle(fontSize: 25.0),),
              const SizedBox(height: 30.0,),
              MyDropDownMenuWidget(updateBurger: updateBurger),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: burger.fries, onChanged: (bool? value){
                    setState(() {
                      burger.fries = value as bool;
                      totalPrice = burger.getTotalPrice();
                    });
                  }),
                  const Text('Fries(\$2)    ', style: TextStyle(fontSize: 18.0),),
                  Checkbox(value: burger.cola, onChanged: (bool? value){
                    setState(() {
                      burger.cola = value as bool;
                      totalPrice = burger.getTotalPrice();
                    });
                  }),
                  const Text('Cola(\$1)    ', style: TextStyle(fontSize: 18.0),),
                  Checkbox(value: burger.dips, onChanged: (bool? value){
                    setState(() {
                      burger.dips = value as bool;
                      totalPrice = burger.getTotalPrice();
                    });
                  }),
                  const Text('Dips(\$1)    ', style: TextStyle(fontSize: 18.0),),
                ],
              ),
              const SizedBox(height: 20.0,),
              DeliveryWidget(burger: burger, updateDelivery: updateDelivery),
              const SizedBox(height: 50.0,),
              Text('Total price: \$$totalPrice', style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      );
    }
}
