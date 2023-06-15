import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tes11/cart_model/cart_model.dart';

import 'Cart_Page.dart';
import 'Item_Tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[300],
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          )),
          backgroundColor: Colors.black,
          child: Icon(Icons.shopping_bag),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text('Good Morning'),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Let's order fresh items for you",
                    style: GoogleFonts.notoSerif(
                      fontSize: 36,
                    ),
                  )),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Fresh Items',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () =>
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index),
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ));
  }
}
