
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feature/owner/entity/my_products_entity.dart';

class ProductsGridView extends StatelessWidget {
  final BaseMyProductEntity baseMyProductEntity;

  const ProductsGridView({super.key, required this.baseMyProductEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: AppColors.mediumGolden1,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.w, // Horizontal space between items
            mainAxisSpacing: 10.h, // Vertical space between items
            childAspectRatio: 0.8, // Aspect ratio of the cards
          ),
          itemCount: baseMyProductEntity.products.length,
          itemBuilder: (context, index) => postItem(baseMyProductEntity, index),
        ),
      ),
    );
  }

  Widget postItem(BaseMyProductEntity baseMyProductEntity, int index) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: baseMyProductEntity.products.isNotEmpty &&
                    baseMyProductEntity.products[index].productData.photos.isNotEmpty
                ? Container(
                    height: 150.h,
                    width: 150.w,
                    child: CachedNetworkImage(
                      imageUrl: baseMyProductEntity.products[index].productData.attributes[0].icon,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  )
                : const CupertinoActivityIndicator(),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          baseMyProductEntity.products[index].productData.name,
          style: TextStyle(
            color: AppColors.mediumGolden1,
            fontFamily: 'bahnschrift',
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
