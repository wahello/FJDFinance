import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class SliderView extends StatelessWidget {
  SliderView({Key key, this.imgHeight: 137.0, this.imgs}) : super(key : key);
  final imgHeight;
  List<String> imgs = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      // 限制轮播图高度
      constraints: BoxConstraints.expand(
        height: imgHeight,
      ),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network(imgs[index],fit: BoxFit.fill,);
        },
        itemCount: imgs.length,
        // 设置 SwiperPagination() 展示默认分页指示器
        pagination: SwiperPagination(
            margin: EdgeInsets.all(0.0),
            builder: SwiperCustomPagination(builder:
                (BuildContext context, SwiperPluginConfig config) {

              // 这个控件的作用是添加额外的限制条件（constraints）到child上
              return ConstrainedBox(
                // 分期控制器的高度
                constraints: BoxConstraints.expand(height: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        // 分页控制器
                        child: DotSwiperPaginationBuilder(
                                color: Colors.black12,
                                activeColor: const Color(0xFF007aff),
                                size: 5.0,
                                activeSize: 5.0)
                            .build(context, config),
                      ),
                    )
                  ],
                ),
              );
        })),   
        // 自动播放开关
        autoplay: true,
      ),
    );
  }
}