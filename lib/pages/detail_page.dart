import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shop_demo/pages/comment_page.dart';
import 'package:shop_demo/pages/detail_page/bottom_dialog_detail.dart';
import 'package:shop_demo/pages/detail_page/swiper_detail.dart';
import 'package:shop_demo/util/bar_util.dart';
import 'package:shop_demo/util/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 

class DetailPage extends StatefulWidget {
  final int id;
  DetailPage({
    this.id
  });
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with AutomaticKeepAliveClientMixin {

  var images = [
        'https://img.alicdn.com/imgextra/i2/374826388/O1CN01yRhGml1x3kZNimzyU_!!374826388.jpg',
        'https://img.alicdn.com/imgextra/i1/374826388/O1CN01f0q3y61x3kZRmsItT_!!374826388.jpg',
        'https://img.alicdn.com/imgextra/i3/374826388/O1CN01DyzJ9s1x3kZQ12yO2_!!374826388.jpg',
        'https://img.alicdn.com/imgextra/i3/374826388/O1CN01MCLUWg1x3kZRmvrQv_!!374826388.jpg'
        
       ];

  void  _jumpToCommentPage() {

     NavigatorUtil.push(
        context,
        CommentPage()
     );

  }     

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          child: Scaffold(
            appBar: _appBar,
            body: _listView,
          ),
        ),
      ) ,
    );
  }

  Widget get _appBar{
    return AppBarSetting(title:'详情').arrowBack(context);
  }

  Widget get _listView {
    var swiper = SwiperDetail(bannerList: images); 
    double padding =  6;
    var fontSize = ScreenUtil().setSp(30);
    var rowHeight =  ScreenUtil().setHeight(58);
    return ListView(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(610),
            child: swiper.init(),
          ),
          
          //价格、标题
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xffeeeeee),width:6),bottom: BorderSide(color: Color(0xffeeeeee),width: 6)),
              
            ),
            child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text('￥2999',style: TextStyle(color: Colors.deepOrange),),
                  )

                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: 
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: Text('小八同学2019春季新款私服推荐女小女人粉色圆领长袖显白显胸',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                       ),
                  )
                ],
              )
            ],
          ),
          ),
          
          //发货、服务、选择、面料
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xffeeeeee),width: 5),bottom: BorderSide(color: Color(0xffeeeeee),width: 5)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: rowHeight,
                      padding: EdgeInsets.all(padding),
                      child: Text('发货',style: TextStyle(color: Colors.black38,fontSize: fontSize),),
                     ),
                    Container(
                      height: rowHeight,
                      padding: EdgeInsets.all(padding),
                      child: Text('浙江发货',style: TextStyle(color: Colors.black,fontSize: fontSize),),
                    )
                    
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: rowHeight,
                      padding: EdgeInsets.all(padding),
                      child: Text('服务',style: TextStyle(color: Colors.black38,fontSize: fontSize),),
                    ),
                    Container(
                      height: rowHeight,
                      padding: EdgeInsets.all(padding),
                      child: Text('7天无理由退货',style: TextStyle(color: Colors.black,fontSize: fontSize),),
                    )
                    
                  ],
                ),
               
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: rowHeight,
                      padding: EdgeInsets.all(padding),
                      child: Text('选择',style: TextStyle(color: Colors.black38,fontSize: fontSize),),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: rowHeight,
                          padding: EdgeInsets.all(padding),
                          child: Text('选择 尺码，主要颜色',style: TextStyle(color: Colors.black,fontSize: fontSize),),
                        ),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: (){_showModalBottomSheetDialog(context);},
                                child: Container(
                                  margin: EdgeInsetsDirectional.only(end: 10),
                                  alignment: Alignment.center,
                                  width: ScreenUtil().setWidth(46),
                                  height: ScreenUtil().setHeight(46),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))

                                  ),
                                  child: Text('S',style: TextStyle(fontSize: ScreenUtil().setSp(24)),),
                                ),
                              ),
                              InkWell(
                                onTap: (){_showModalBottomSheetDialog(context);},
                                child: Container(
                                  margin: EdgeInsetsDirectional.only(end: 10),
                                  alignment: Alignment.center,
                                  width: ScreenUtil().setWidth(46),
                                  height: ScreenUtil().setHeight(46),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))

                                  ),
                                  child: Text('M',style: TextStyle(fontSize: ScreenUtil().setSp(24)),),
                                ),
                              ),
                              InkWell(
                                onTap: (){_showModalBottomSheetDialog(context);},
                                child:  Container(
                                  margin: EdgeInsetsDirectional.only(end: 6),
                                  alignment: Alignment.center,
                                  width: ScreenUtil().setHeight(222),
                                  height: ScreenUtil().setWidth(46),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))

                                  ),
                                  child: Text('目前就只有这两款',style: TextStyle(fontSize: ScreenUtil().setSp(26)),),
                                ),
                              )
                             
                            ],
                          )
                        )
                      ],
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Container(
                      height: rowHeight,
                      padding: EdgeInsets.all(padding),
                      child: Text('参数',style: TextStyle(color: Colors.black38,fontSize: fontSize),),
                      ),
                    Container(
                      height: rowHeight,
                      padding: EdgeInsets.all(padding),
                      child: Text('面料 尺码...',style: TextStyle(color: Colors.black,fontSize: fontSize),),
                      )
                    
                  ],
                ),

                
              ],
            )
          ),
          
          //评论
          Container(
            padding: EdgeInsetsDirectional.only(start: 12,top: 6,bottom: 6,end: 12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xffeeeeee),width: 5),bottom: BorderSide(color: Color(0xffeeeeee),width: 5)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(padding),
                        child: Text('宝贝评价(101)',style: TextStyle(color: Colors.black,fontSize: 14),),
                      ),
                    
                    Expanded(
                      child: Row(
                      children: <Widget>[
                       Expanded(
                         child: InkWell(
                           onTap:  _jumpToCommentPage,
                           
                           child: Container(
                            padding: EdgeInsets.all(padding),
                            alignment: Alignment.centerRight,
                            child: Text('查看全部 >',style: TextStyle(color: Colors.deepOrange,fontSize: 14),),
                            ),
                         )
                       )
                      ],
                    ),
                    )
                    
                  ],
                ),
              ],
            ),
          ), 
       
          //宝贝详情
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xffeeeeee),width: 5),bottom: BorderSide(color: Color(0xffeeeeee),width: 5)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text('宝贝详情',style: TextStyle(color: Colors.black),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                     Image.network('https://img.alicdn.com/imgextra/i3/374826388/O1CN019dLpqP1x3kZQfg120_!!374826388.jpg'),
                     Image.network('https://img.alicdn.com/imgextra/i4/374826388/O1CN018feoTt1x3kZQfnSz0_!!374826388.jpg'),
                     Image.network('https://img.alicdn.com/imgextra/i4/374826388/O1CN01UGdQvg1x3kZRXtF1w_!!374826388.jpg')
                       
                  ],
                )
              ],
            ),
          ),
        ],
      );
  }

   //showModalBottomSheet与BottomSheet的区别是 BottomSheet充满屏幕，ModalBottomSheet半屏
  void _showModalBottomSheetDialog2(BuildContext context)  {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
              ),
              child: 
                   GestureDetector(
                     onTap: (){},
                     onVerticalDragDown: (DragDownDetails details){},
                     child: Column(
                       children: <Widget>[
                         new ListTile(
                           leading: new Icon(Icons.chat),
                           title: new Text("AAAA"),
                         ),
                         new ListTile(
                           leading: new Icon(Icons.help),
                           title: new Text("BBBBB"),
                         ),
                         new ListTile(
                           leading: new Icon(Icons.settings),
                           title: new Text("CCCCC"),
                         ),
                         new ListTile(
                           leading: new Icon(Icons.more),
                           title: new Text("DDDDD"),
                         ),
                         Expanded(
                           child: Container(
                             color: Colors.red,
                           ),
                         )
                        
                       ],
                     ),
                   )
           
          );
        });

    
 
  }

  void _showModalBottomSheetDialog(BuildContext context){

     BottomDialogDetail().showModalBottomSheetDialog(context);
     

  }
}