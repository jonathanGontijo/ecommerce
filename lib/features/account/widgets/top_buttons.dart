import 'package:ecommerce/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Suas Compras", onTap: () {}),
            AccountButton(text: 'Devoluções', onTap: () {}),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(text: "Log Out", onTap: () {}),
            AccountButton(text: 'Lista de Desejos', onTap: () {}),
          ],
        )
      ],
    );
  }
}
