import 'package:flutter/material.dart';
import 'package:shop_demo/pages/detail_page.dart';
import 'package:shop_demo/util/navigator_util.dart';
import 'package:shop_demo/widget/cached_image.dart';
import 'package:shop_demo/widget/swiper_block.dart';

class SwiperHome {
  final List<String>  bannerList;
  SwiperHome({
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