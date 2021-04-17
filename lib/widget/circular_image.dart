/*
 * @Description: flutter we_shop
 * @Author: dong
 * @Date: 2021-04-17 10:45:59
 * @LastEditTime: 2021-04-17 11:12:20
 * @LastEditors: dong
 */
import 'package:flutter/material.dart';

import 'cached_image.dart';

class CircularImage extends StatelessWidget {

  final double width;
  final double height;
  final double circular;
  final String imageURL;

  const CircularImage({
    this.width = 40, 
    this.height = 40, 
    this.circular = 20,
    @required this.imageURL
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      child: PhysicalModel(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(circular),
        child: CachedImage(imageUrl: imageURL),
      ),
    );
  }
}