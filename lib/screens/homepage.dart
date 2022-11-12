import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/constants.dart';
import 'package:fooddelivery/mainmenu.dart';
import 'package:fooddelivery/models/sellermodel.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';

import '../utils/APIcalls.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Container(
                      height: 45.h,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Vellore Institute of Technology",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              Text(
                                "Kelambakkam - Vandalur Rd",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25.0.sp),
                            child: CachedNetworkImage(
                              height: 35.h,  
                                imageUrl:
                                    "https://media-exp1.licdn.com/dms/image/C4D03AQH7nD5jgTYpUw/profile-displayphoto-shrink_800_800/0/1661285518630?e=2147483647&v=beta&t=qFFwNCo54W05xYCW3Vx3_OjzdYw2oAtFwo4filNvnxg"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 5.h),
                    child: InkWell(
                      child: Container(
                        height: 35.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.06),
                            border: Border.all(color: Colors.grey, width: 0.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp))),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Search 'Pizza'",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.search,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Constants.screensPageViewController.animateToPage(1,
                            duration: Duration(milliseconds: 10),
                            curve: Curves.easeInOut);
                      },
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 65.h,
                            width: 65.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0.sp),
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "https://pngimg.com/uploads/mug_coffee/mug_coffee_PNG16828.png"),
                            ),
                          ),
                          const Text(
                            "Drinks",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 65.h,
                            width: 65.w,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0.sp),
                                child: Padding(
                                  padding: EdgeInsets.all(6.0.sp),
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          "https://i.pinimg.com/736x/20/d2/2e/20d22e9fd90b6ec066e84ac52ac747eb.jpg"),
                                )),
                          ),
                          const Text("Pizza",
                              style: TextStyle(fontWeight: FontWeight.w600))
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                             height: 65.h,
                            width: 65.w,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0.sp),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "https://pngimg.com/uploads/burger_sandwich/burger_sandwich_PNG4135.png")),
                          ),
                          const Text("Burgers",
                              style: TextStyle(fontWeight: FontWeight.w600))
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 65.h,
                            width: 65.w,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0.sp),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "https://freepngimg.com/download/ice_cream/25082-2-ice-cream-cup-photos.png")),
                          ),
                          const Text("Ice Creams",
                              style: TextStyle(fontWeight: FontWeight.w600))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const SellerSlider(),
                  SizedBox(
                    height: 2.h,
                  ),
                  const HomeBottomList(),
                ],
              )),
        ),
      ),
    );
  }
}

class SellerSlider extends StatefulWidget {
  const SellerSlider({super.key});

  @override
  State<SellerSlider> createState() => _SellerSliderState();
}

class _SellerSliderState extends State<SellerSlider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var items = data.data as List<SellersDataModel>;
          return CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Card(
              elevation: 0,
              color: Colors.grey.withOpacity(.09),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Container(
                child: Center(
                    child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: CachedNetworkImage(
                            imageUrl: items[itemIndex].image.toString()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0.sp),
                      child: Text(
                        items[itemIndex].name.toString(),
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                )),
              ),
            ),
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              viewportFraction: 0.75,
              autoPlay: true,
              height: 120.0.h,
            ),
          );
        } else {
          return SizedBox(
              height: 150.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CupertinoActivityIndicator(),
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Text("Please wait."),
                  )
                ],
              ));
        }
      },
    );
  }
}

class HomeBottomList extends StatelessWidget {
  const HomeBottomList({super.key});

  @override
  Widget build(BuildContext context) {
    int itemIndex;
    return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var items = data.data as List<SellersDataModel>;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (
              BuildContext context,
              itemIndex,
            ) =>
                SizedBox(
              height: 120.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      15.w,
                      0.h,
                      15.w,
                      0.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                  width: 15.w,
                                  child: itemIndex % 2 == 0
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2.0.sp),
                                          child: CachedNetworkImage(
                                            
                                              imageUrl:
                                                  "https://rukminim1.flixcart.com/image/40/40/k7usyvk0/nut-dry-fruit/z/d/h/500-organic-cashews-mason-jar-cost-2-cost-original-imafpzw5tskvyvpe.jpeg?q=90"),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(3.0.sp),
                                          child: CachedNetworkImage(
                                              imageUrl:
                                                  "https://newasianvillagedelivery.com/assets/restaurantcmswebsite/images/nv-icon.jpg"),
                                        ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade400,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2.0.sp),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0.sp),
                                    child: Text(
                                      "Best Selling",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              items[itemIndex].name.toString(),
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Rs 100",
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: 190.w,
                              child: Text(
                                items[itemIndex].description.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0.sp),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(.09),
                                height: 90.h,
                                width: 90.w,
                              ),
                              CachedNetworkImage(
                                height: 80.h,
                                width: 80.w,
                                imageUrl: items[itemIndex].image.toString(),
                              ),
                              SizedBox(
                                height: 99.h,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 50.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade400,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.0.sp),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2.0.sp),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ADD +",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CupertinoActivityIndicator(),
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Text("Please wait."),
                  )
                ],
              ));
        }
      },
    );
  }
}
