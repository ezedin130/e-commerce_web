import 'package:e_commerce_mobile/util/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../model/product_dto.dart';
import '../../../../../service/product_service.dart';
import '../../../../../util/snackbar.dart';

class AddProductDialog extends StatelessWidget {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  final productService = ProductService();

  void handleCreateProduct(BuildContext context) async {
    final dto = ProductDto(
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      price: double.parse(priceController.text.trim()),
    );

    final response = await productService.createProduct(dto);

    if (response) {
      showSnackBar(context, "Product created successfully!");
      Navigator.pop(context);
    } else {
      showSnackBar(context, "Failed to create product");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add New Product",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Product Name",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              ReUsableTextfield(
                text: "Enter product name",
                obscure: false,
                icon: Icons.add,
                controller: nameController,
              ),
              const SizedBox(height: 20),
              Text(
                "Description",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              ReUsableTextfield(
                text: "Enter description",
                obscure: false,
                maxLines: 3,
                icon: Icons.description,
                controller: descriptionController,
              ),
              const SizedBox(height: 20),
              Text(
                "Product Name",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              ReUsableTextfield(
                text: "0.00",
                obscure: false,
                icon: Icons.add,
                controller: priceController,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  hoverColor: Colors.blue.withOpacity(0.3),
                  onTap: () {
                    handleCreateProduct(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        'Save Product',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
