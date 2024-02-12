import 'package:ecommerce/constants/global_variables.dart';
import 'package:ecommerce/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // tempory list
  List list = [
    'https://images.unsplash.com/photo-1560617544-b4f287789e24?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGVsZWZvbmUlMjBjZWx1bGFyJTIwJTdDfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1560617544-b4f287789e24?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGVsZWZvbmUlMjBjZWx1bGFyJTIwJTdDfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1560617544-b4f287789e24?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGVsZWZvbmUlMjBjZWx1bGFyJTIwJTdDfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1560617544-b4f287789e24?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGVsZWZvbmUlMjBjZWx1bGFyJTIwJTdDfGVufDB8fDB8fHww',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Ordens',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Text(
                'Veja Tudo',
                style: TextStyle(
                    color: GlobalVariables.selectedNavBarColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  image: list[index],
                );
              }),
        ),
      ],
    );
  }
}
