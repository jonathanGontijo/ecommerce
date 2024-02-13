import 'package:ecommerce/constants/global_variables.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Produtos')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: 'Adicionar produtos',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}