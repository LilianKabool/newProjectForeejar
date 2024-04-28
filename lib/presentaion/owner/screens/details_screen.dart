import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled/presentaion/owner/screens/update_product.dart';
import '../../../core/constant/colors.dart';
import '../../../feature/owner/entity/my_products_entity.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductData product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: AppColors.darkGolden,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImageCarousel(),
            SizedBox(height: 16),
            _buildProductName(),
            SizedBox(height: 8),
            _buildPrice(),
            SizedBox(height: 8),
            _buildDescription(),
            SizedBox(height: 8),
            _buildDetails(),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 8),
            _buildAttributes(),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OwnerEditProductScreen(
                      productData: product,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return product.photos.isNotEmpty
            ? SizedBox(
                height: 300,
                child: CachedNetworkImage(
                  imageUrl: product.photos[index].photo,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: Colors.red),
                ),
              )
            : Center(child: Icon(Icons.error, color: Colors.red));
      },
      options: CarouselOptions(
        height: 300,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 6),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: product.photos.length,
    );
  }

  Widget _buildProductName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        product.name,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.darkGolden),
      ),
    );
  }

  Widget _buildPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        'Price: ${product.price} ${product.priceUnit}',
        style: TextStyle(fontSize: 20, color: AppColors.mediumGolden1),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        product.description,
        style: TextStyle(fontSize: 16, color: AppColors.darkGray),
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Country', product.countryName),
        _buildDetailRow('City', product.cityName),
        _buildDetailRow('Region', product.regionName),
        _buildDetailRow('Start Date', product.startDate),
        if (product.endDate != null)
          _buildDetailRow('End Date', product.endDate!),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGolden),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: AppColors.mediumGray),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttributes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Attributes',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGolden),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: product.attributes.length,
          itemBuilder: (context, index) {
            Attribute attribute = product.attributes[index];
            return ListTile(
              title: Text(attribute.name,
                  style: TextStyle(color: AppColors.darkGray)),
              subtitle: Text(attribute.value,
                  style: TextStyle(color: AppColors.mediumGray)),
              leading: Icon(Icons.check, color: AppColors.mediumGolden1),
            );
          },
        ),
      ],
    );
  }
}
