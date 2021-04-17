/*
 * @Description: flutter we_shop
 * @Author: dong
 * @Date: 2021-04-17 10:45:59
 * @LastEditTime: 2021-04-17 10:50:14
 * @LastEditors: dong
 */
import 'package:flutter/material.dart';
import 'package:shop_demo/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  _appBar(context)
    );
  }
  
}


Widget _appBar(BuildContext context) {

  return  SearchBar(
    normalSearch: false
  );
            
}

  