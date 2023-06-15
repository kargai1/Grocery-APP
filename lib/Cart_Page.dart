import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes11/cart_model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: Text('My Cart'),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shadowColor: Colors.deepPurple,
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.asset(value.cartItems[index][2]),
                              title: Text(value.cartItems[index][0]),
                              subtitle: Text('' + value.cartItems[index][1]),
                              trailing: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemFromCart(index),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[300],
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(color: Colors.green[100]),
                              ),
                              Text(
                                '\$' + value.calculateTotal(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green.shade100),
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.all(12),
                            child: Row(children: [
                              Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ]),
                          )
                        ],
                      )),
                ),
              ],
            );
          },
        ));
  }
}
