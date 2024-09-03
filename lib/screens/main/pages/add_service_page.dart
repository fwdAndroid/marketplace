import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/utils/colors.dart';
import 'package:marketplace/widgets/save_button.dart';
import 'package:marketplace/widgets/text_form_field.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final Map<String, List<String>> _serviceCategories = {
    'Plumbing': ['Pipe Installation', 'Leak Repair', 'Water Heater'],
    'Electrical': ['Wiring', 'Lighting', 'Appliance Repair'],
    'Cleaning': ['House Cleaning', 'Carpet Cleaning', 'Window Cleaning'],
  };

  String? _selectedCategory;
  String? _selectedSubCategory;
  List<String> _subCategories = [];

  // Image
  Uint8List? _image;

  // Loading bar
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Add Service",
            style: GoogleFonts.workSans(
              color: colorBlack,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: TextFormInputField(
                  maxLenght: 30,
                  controller: serviceNameController,
                  hintText: "Title Name",
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 30,
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        borderSide: BorderSide(
                          color: textColor,
                        )),
                    contentPadding: EdgeInsets.all(8),
                    fillColor: Color(0xffF6F7F9),
                    hintText: "Description",
                    hintStyle: GoogleFonts.nunitoSans(fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: _image != null
                    ? CircleAvatar(
                        radius: 59, backgroundImage: MemoryImage(_image!))
                    : GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/Choose Image.png"),
                        ),
                      ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  isExpanded: true,
                  hint: Text('Select Service Category'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                      _subCategories = _serviceCategories[_selectedCategory]!;
                      _selectedSubCategory = null; // Reset subcategory
                    });
                  },
                  items: _serviceCategories.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),

              // Subcategory Dropdown
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedSubCategory,
                  hint: Text('Select Subcategory'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSubCategory = newValue;
                    });
                  },
                  items: _subCategories
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: TextFormInputField(
                        controller: priceController,
                        hintText: "Price",
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: TextFormInputField(
                        controller: discountController,
                        hintText: "Price Per Hr",
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),

              SaveButton(
                title: "Publish",
                onTap: () async {},
              ),
            ],
          ),
        ));
  }
}

// Functions
/// Select Image From Gallery

void showMessageBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}
