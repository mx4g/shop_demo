/*
 * @Description: flutter we_shop
 * @Author: dong
 * @Date: 2021-04-17 10:45:59
 * @LastEditTime: 2021-04-17 10:58:01
 * @LastEditors: dong
 */
import 'package:flutter/material.dart';
import 'package:shop_demo/widget/cached_image.dart';
import 'package:shop_demo/widget/swiper_block.dart';

class SwiperDetail {
  final List<String>  bannerList;
  final bool isNumberPagination;
  SwiperDetail({
    this.bannerList,
    this.isNumberPagination = true,
  });

 
  Widget init() {

    return SwiperBlock(
      isNumberPagination: isNumberPagination,
      count: bannerList.length,
      itemBuilder: _item,
    );
  }

 

  Widget _item(BuildContext context, int index){
   
    return InkWell(
    
      child: CachedImage(
        imageUrl: bannerList[index],
        fit: BoxFit.fitWidth,
      ),
    );

  }
   

}