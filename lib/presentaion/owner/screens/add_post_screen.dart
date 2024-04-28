// import 'dart:io';
//
// import 'package:ejar_v/presentaion/user/manager/get_full_countries_cubit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
//
// class MultipleImagePicker extends StatefulWidget {
//   final void Function(List<XFile> images) onImagesSelected;
//
//   const MultipleImagePicker({super.key, required this.onImagesSelected});
//
//   @override
//   _MultipleImagePickerState createState() => _MultipleImagePickerState();
// }
//
// class _MultipleImagePickerState extends State<MultipleImagePicker> {
//   List<XFile> _selectedImages = [];
//
//   Future<void> _pickImages() async {
//     final List<XFile>? selected = await ImagePicker().pickMultiImage();
//     if (selected != null) {
//       setState(() {
//         _selectedImages = selected;
//       });
//       widget.onImagesSelected(_selectedImages);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: List.generate(
//               _selectedImages.length + 1,
//                   (index) {
//                 if (index == _selectedImages.length) {
//                   return GestureDetector(
//                     onTap: _pickImages,
//                     child: Container(
//                       width: 120,
//                       height: 120,
//                       margin: const EdgeInsets.only(
//                           right: 8), // Add margin between boxes
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.add_photo_alternate,
//                           size: 48,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Container(
//                     width: 120,
//                     height: 120,
//                     margin: const EdgeInsets.only(
//                         right: 8), // Add margin between boxes
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       image: DecorationImage(
//                         image: FileImage(File(_selectedImages[index].path)),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({super.key});
//   @override
//   _AddPostScreenState createState() => _AddPostScreenState();
// }
//
// class _AddPostScreenState extends State<AddPostScreen> {
//   @override
//   void initState() {
//     context.read<GetFullCountriesCubit>().emitgetFullCountries();
//     // TODO: implement initState
//     super.initState();
//   }
//   final TextEditingController _productNameController = TextEditingController();
//   final TextEditingController _productPriceController = TextEditingController();
//   final TextEditingController _productQuantityController =
//   TextEditingController();
//   final TextEditingController _productDiscountController =
//   TextEditingController();
//   final TextEditingController _productDiscountTimeController =
//   TextEditingController();
//   final TextEditingController _productDescriptionController =
//   TextEditingController();
//   final FocusNode _productNameFocusNode = FocusNode();
//   final FocusNode _productPriceFocusNode = FocusNode();
//   final FocusNode _productQuantityFocusNode = FocusNode();
//   final FocusNode _productDiscountFocusNode = FocusNode();
//   File? _selectedImage;
//
//   List<XFile> _selectedProductImages = [];
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   Future<void> _selectImage(ImageSource source) async {
//     final pickedImage = await ImagePicker().pickImage(source: source);
//
//     if (pickedImage != null) {
//       setState(() {
//         _selectedImage = File(pickedImage.path);
//       });
//     }
//   }
//
//   Future<void> _showImageSourceDialog() async {
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Select Image Source'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _selectImage(ImageSource.gallery);
//               },
//               child: const Text('Gallery'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _selectImage(ImageSource.camera);
//               },
//               child: const Text('Camera'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _onProductImagesSelected(List<XFile> images) {
//     setState(() {
//       _selectedProductImages = images;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Add Product',
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             //crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               _buildTitleRow('Product Details Images', Icons.image),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: MultipleImagePicker(
//                     onImagesSelected: _onProductImagesSelected),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               _buildTitleRow('Product Name', Icons.precision_manufacturing),
//               buildTextField(
//                 label: 'Product Name',
//                 controller: _productNameController,
//                 hintText: 'Enter product name',
//                 keyboardType: TextInputType.text,
//                 textInputAction: TextInputAction.next,
//                 focusNode: _productNameFocusNode,
//                 nextFocusNode: _productPriceFocusNode,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'Please enter product name';
//                   }
//                   return null;
//                 },
//               ),
//               _buildTitleRow('Product Price', Icons.price_change),
//               buildTextField(
//                 label: 'Product Price',
//                 controller: _productPriceController,
//                 hintText: 'Enter product price',
//                 keyboardType: TextInputType.number,
//                 textInputAction: TextInputAction.next,
//                 focusNode: _productPriceFocusNode,
//                 nextFocusNode: _productQuantityFocusNode,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'Please enter product price';
//                   }
//                   return null;
//                 },
//               ),
//               _buildTitleRow(
//                   'Product Quantity', Icons.production_quantity_limits),
//               buildTextField(
//                 label: 'Product Price',
//                 controller: _productQuantityController,
//                 hintText: 'Enter product quantity',
//                 keyboardType: TextInputType.number,
//                 textInputAction: TextInputAction.next,
//                 focusNode: _productQuantityFocusNode,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'Please enter product quantity';
//                   }
//                   return null;
//                 },
//               ),
//               buildDropDownCountries(
//                   label: "country",
//                   controller: _productQuantityController),
//               _buildTitleRow('Product Discount', Icons.discount),
//               buildTextField(
//                 label: 'Product Discount',
//                 controller: _productDiscountController,
//                 hintText: 'Enter product discount',
//                 keyboardType: TextInputType.number,
//                 textInputAction: TextInputAction.done,
//                 focusNode: _productDiscountFocusNode,
//                 // validator: (value) {
//                 //   if (value?.isEmpty ?? true) {
//                 //     return 'Please enter product discount';
//                 //   }
//                 //   return null;
//                 // },
//               ),
//               _buildTitleRow('Discount Time End', Icons.timelapse),
//               GestureDetector(
//                 onTap: () async {
//                   await _selectDateTime();
//                   FocusScope.of(context)
//                       .requestFocus(_productDiscountFocusNode);
//                 },
//                 child: AbsorbPointer(
//                   child: buildTextField(
//                     label: 'Discount Time End',
//                     controller: _productDiscountTimeController,
//                     hintText: 'Enter product discount',
//                     keyboardType: TextInputType.text,
//                     textInputAction: TextInputAction.done,
//                     // validator: (value) {
//                     //   if (value?.isEmpty ?? true) {
//                     //     return 'Please enter product discount';
//                     //   }
//                     //   return null;
//                     // },
//                   ),
//                 ),
//               ),
//               _buildTitleRow('Product Description', Icons.description),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//                 child: TextFormField(
//                   controller: _productDescriptionController,
//                   maxLines: 5,
//                   decoration: const InputDecoration(
//                     labelText: 'Product Description',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the description';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               _buildTitleRow('Main Image', Icons.image_aspect_ratio),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: _showImageSourceDialog,
//                 child: Container(
//                   width: 120,
//                   height: 120,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: _selectedImage != null
//                       ? Image.file(
//                     _selectedImage!,
//                     fit: BoxFit.cover,
//                   )
//                       : const Center(
//                     child: Icon(
//                       Icons.add_photo_alternate,
//                       size: 48,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _selectDateTime() async {
//     final selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//     );
//
//     if (selectedDate != null) {
//       final selectedTime = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//       );
//
//       if (selectedTime != null) {
//         final selectedDateTime = DateTime(
//           selectedDate.year,
//           selectedDate.month,
//           selectedDate.day,
//           selectedTime.hour,
//           selectedTime.minute,
//         );
//
//         _productDiscountTimeController.text = selectedDateTime.toString();
//       }
//     }
//   }
//   Widget buildDropDownCountries({
//     required String label,
//     required TextEditingController controller,
//     String? hintText,
//     TextInputType keyboardType = TextInputType.text,
//     TextInputAction textInputAction = TextInputAction.next,
//     FocusNode? focusNode,
//     FocusNode? nextFocusNode,
//     String? Function(String?)? validator,
//     // Remove countries argument (we'll fetch from cubit)
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//       child: BlocBuilder<GetFullCountriesCubit, GetFullCountriesState>(
//         builder: (context, state) {
//           return DropdownButtonFormField<String>(
//             value: controller.text.isEmpty ? null : controller.text, // Initial value
//             hint: Text(hintText ?? label),
//             decoration: InputDecoration(
//               labelText: label,
//               contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.blue),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             items: state.maybeWhen(
//               success: (getFullCountriesEntity) => getFullCountriesEntity.data
//                   .map((country) => DropdownMenuItem<String>(
//                 value: country.country.name, // Assuming 'name' is the property for country name
//                 child: Text(country.country.name),
//               ))
//                   .toList(),
//               orElse: () => [], // Empty list if state is not success
//             ),
//             validator: validator,
//             onChanged: (value) {
//               controller.text = value ?? ''; // Set controller value
//               if (nextFocusNode != null) {
//                 FocusScope.of(context).requestFocus(nextFocusNode);
//               }
//             },
//             onSaved: (value) => controller.text = value ?? '', // Optional onSaved
//           );
//         },
//       ),
//     );
//   }
//
//   Widget buildDropDownCities({
//     required String label,
//     required TextEditingController controller,
//     String? hintText,
//     TextInputType keyboardType = TextInputType.text,
//     TextInputAction textInputAction = TextInputAction.next,
//     FocusNode? focusNode,
//     FocusNode? nextFocusNode,
//     String? Function(String?)? validator,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//       child: BlocBuilder<GetFullCountriesCubit, GetFullCountriesState>(
//         builder: (context, state) {
//           return DropdownButtonFormField<String>(
//             value: controller.text.isEmpty ? null : controller.text, // Initial value
//             hint: Text(hintText ?? label),
//             decoration: InputDecoration(
//               labelText: label,
//               contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.blue),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.red),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             items: state.maybeWhen(
//               success: (getFullCountriesEntity) => getFullCountriesEntity.data
//                   .map((country) => DropdownMenuItem<String>(
//                 value: country.country.name, // Assuming 'name' is the property for country name
//                 child: Text(country.country.name),
//               ))
//                   .toList(),
//               orElse: () => [], // Empty list if state is not success
//             ),
//             validator: validator,
//             onChanged: (value) {
//               controller.text = value ?? ''; // Set controller value
//               if (nextFocusNode != null) {
//                 FocusScope.of(context).requestFocus(nextFocusNode);
//               }
//             },
//             onSaved: (value) => controller.text = value ?? '', // Optional onSaved
//           );
//         },
//       ),
//     );
//   }
//   Widget buildTextField({
//     required String label,
//     required TextEditingController controller,
//     String? hintText,
//     TextInputType keyboardType = TextInputType.text,
//     TextInputAction textInputAction = TextInputAction.next,
//     FocusNode? focusNode,
//     FocusNode? nextFocusNode,
//     String? Function(String?)? validator,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         textInputAction: textInputAction,
//         focusNode: focusNode,
//         validator: validator,
//         onFieldSubmitted: (value) {
//           if (nextFocusNode != null) {
//             FocusScope.of(context).requestFocus(nextFocusNode);
//           }
//         },
//         decoration: InputDecoration(
//           labelText: label,
//           hintText: hintText,
//           contentPadding:
//           const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.blue),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red),
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTitleRow(String title, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 3, top: 10),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Text(
//             title,
//           ),
//         ],
//       ),
//     );
//   }
// }