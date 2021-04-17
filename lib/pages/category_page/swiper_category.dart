/*
 * @Description: flutter we_shop
 * @Author: dong
 * @Date: 2021-04-17 10:45:59
 * @LastEditTime: 2021-04-17 10:59:45
 * @LastEditors: dong
 */
import 'package:flutter/material.dart';
import 'package:shop_demo/pages/detail_page.dart';
import 'package:shop_demo/util/navigator_util.dart';
import 'package:shop_demo/widget/cached_image.dart';
import 'package:shop_demo/widget/swiper_block.dart';

class SwiperCategory {
  final List<String>  bannerList;
  SwiperCategory({
    this.bannerList
  });

 
  Widget init() {

    return SwiperBlock(
      count: bannerList.length,
      itemBuilder: _item,
    );
  }

 

  Widget _item(BuildContext context, int index){
   
    return InkWell(
      onTap: (){
         NavigatorUtil.push(context, 
           DetailPage(id: index)
         );
      },
      child: CachedImage(
        imageUrl: bannerList[index],
        fit: BoxFit.fill,
      ),
    );

  }
   

}