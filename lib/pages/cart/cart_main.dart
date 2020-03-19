import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cart_info.dart';
import 'package:flutter_shop/pages/cart/cart_bottom.dart';
import 'package:flutter_shop/pages/cart/cart_content.dart';
import 'package:flutter_shop/provider/cart_info_provider.dart';
import 'package:provider/provider.dart';

import 'cart_empty.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CartInfoProvider>(context, listen: false).getCartInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Consumer<CartInfoProvider>(
        builder: (context, provider, child) {
          List<CartInfo> cartList = provider.cartInfoList;
          if (cartList != null && cartList.length > 0) {
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return CartContent(cartList[index]);
                  },
                ),
                Positioned(
                  bottom: 0,
                  child: CartBottom(),
                ),
              ],
            );
          } else {
            return CartEmpty();
          }
        },
      ),
    );
  }
}
