import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/widgets/custom_button.dart';
import 'package:ecommerce/common/widgets/custom_textfield.dart';
import 'package:ecommerce/constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/constants/utils.dart';
import 'package:ecommerce/features/admin/services/admin_services.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class AddProdutctScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProdutctScreen({super.key});

  @override
  State<AddProdutctScreen> createState() => _AddProdutctScreenState();
}

class _AddProdutctScreenState extends State<AddProdutctScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  String category = 'Mobiles';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essetials',
    'Appliances',
    'Books',
    'Fashion',
  ];
  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Adicionar produto',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map((i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 200,
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.folder_open, size: 40),
                                    const SizedBox(height: 15),
                                    Text(
                                      'Selecionar Imagem',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                  const SizedBox(height: 30),
                  CustomTextField(
                      controller: productNameController,
                      hintText: 'Nome do produto'),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: descriptionController,
                    hintText: 'Descrição',
                    maxLines: 7,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: priceController,
                    hintText: 'Preço ',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: quantityController,
                    hintText: 'quantidade ',
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: category,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: productCategories.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          category = newVal!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Criar',
                    onTap: sellProduct,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
