import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_demo/config/base_config.dart';
import 'package:shop_demo/util/clipper_util.dart';
import 'package:shop_demo/util/navigator_util.dart';
import 'package:shop_demo/widget/bottom_loading_container.dart';
import 'package:shop_demo/widget/image_container.dart';
import 'package:shop_demo/widget/loading_container.dart';
import 'package:shop_demo/widget/search_bar.dart';
import 'package:shop_demo/widget/sub_nav.dart';

import 'detail_page.dart';
import 'home_page/swiper_home.dart';
import 'new_product_page.dart';



class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with AutomaticKeepAliveClientMixin{

  bool _loading = true; //页面加载状态
  int _backgroundColor = ColorConfig.backgroundColor;

  var data = [{'image':'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/3468644741/O1CN01pyeQUk1ktQGL9rhpt_!!3468644741.jpg',
                'title':'恶搞图 禁止砍伐环保 2019夏半袖衣服网红ins短袖T恤男情侣宽松潮',
                'price':'58.00'
              },
            ];
  int _count = 10;   
  bool _isHasData = true;    
   

  ScrollController _scrollController = ScrollController();

  //缓存页面
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _hideScreen();
    _pullUpLoading();
    super.initState();
  }

  
  //显示加载进度条
  Future<void> _hideScreen() async {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
       _loading = false; 
      });
    });
  }


  //上拉加载
  void _pullUpLoading(){
    //监听滑动到底部时，加载更多
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
         _getData();
      }
    });    
  }

    // 上拉加载更多
  Future _getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {

        _count <20 ? _count += 10 : _isHasData = false;
      });
    });
  }
 

  @override
  Widget build(BuildContext context) {
   super.build(context);
   return LoadingContainer(
      isLoading: _loading,
      child: Scaffold(
         appBar: _appBar,
         backgroundColor: Color(_backgroundColor),
         body: ListView(
           controller: _scrollController,
           children: <Widget>[

             _banner,

             Container(
               padding: EdgeInsetsDirectional.only(start: 12,end: 12),
               child: Column(
                 children: <Widget>[
                   _categoryGrid,
                   _wrapList
                 ],
               ),
             ),
           ],
         ),
      ),
    );
    
  }

 
  /*搜索栏*/
  Widget get _appBar {

    return  SearchBar();
             

  }
 
  /*轮播图*/
  Widget get _banner {
    var bannerList = ['http://img.alicdn.com/tps/i4/TB1N01ncRGw3KVjSZFwSuvQ2FXa.jpg_q90_.webp',
                       'https://img.alicdn.com/simba/img/TB1lEBtc8Cw3KVjSZFuSuwAOpXa.jpg',
                       'https://img.alicdn.com/simba/img/TB13RYlXBGw3KVjSZFwSuvQ2FXa.jpg',
                       'https://img.alicdn.com/simba/img/TB1HThXc.GF3KVjSZFoSuvmpFXa.jpg',
                       'https://img.alicdn.com/tfs/TB1WYMlcliE3KVjSZFMXXbQhVXa-520-280.jpg_q90_.webp'
                       ];
    var swiper = SwiperHome(bannerList: bannerList);    

    return 
      Container(
        color: Color(_backgroundColor),
        child:  ClipPath(
          clipper: TopClipper(),
          child: Container(
            height: ScreenUtil().setWidth(240),
            child: swiper.init(),
          )
        ),
      );
   
  }

  //子导航  
  Widget get _categoryGrid {
    
    var list = ['新品','美妆','体育','娱乐','旅游','搞笑','音乐','电影','数码','生活用品'];
    return SubNav(
      subNavList: list,height: 
      ScreenUtil().setHeight(290),
      onClick: (String val){
        NavigatorUtil.push(context, NewProductPge(title:val,type: 1,));
      },
    ); 

  }

  Widget get _wrapList{
 
    return Wrap(
      spacing: 2,
      alignment: WrapAlignment.center,
      children: _imageBox,
       
    );
  }

  List<Widget> get _imageBox{
    List<Widget> item = new List<Widget>();

    for(var i=1;i<= _count;i++) {
      item.add(_getListWidget(i));
    }
    
    
    item.add(BottomLoadingContainer(isLoadMore:_isHasData)) ;  
    return item;
  }

  Widget  _getListWidget(i){
    return
      InkWell(
        onTap: (){ 
          NavigatorUtil.push(context, 
           DetailPage(id: i)
          );
        },
        child:ImageContainer(
          height: ScreenUtil().setHeight(318),
          width:  ScreenUtil().setWidth(318),
          price: data[0]['price'],
          title: data[0]['title'],
          imageUrl: data[0]['image'],
      ),
    );
    
  }

   
    
  
}