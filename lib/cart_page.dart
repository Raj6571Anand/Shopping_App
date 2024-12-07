import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'global_variables.dart';

class CartPage extends StatelessWidget {

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                cartItem['imageUrl'].toString(),
              ),
              radius: 30,
            ),
            trailing: IconButton(onPressed: (){
              Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);

            }, icon: const Icon(Icons.delete,color: Colors.red,)),
          );
        },
      ),
    );
  }
}
