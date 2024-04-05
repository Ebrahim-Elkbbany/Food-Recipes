import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.imageUrl, required this.width, required this.height});

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        errorWidget: (context, url, error) {
          return   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error),
              Text('ERROR',style: TextStyle(
          fontSize: 14.sp,
          ),),
            ],
          );
        },
        imageUrl: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
