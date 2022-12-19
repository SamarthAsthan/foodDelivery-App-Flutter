import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/constants.dart';
import 'package:fooddelivery/models/home_model.dart';
import 'package:fooddelivery/services/APICalls.dart';
import 'package:fooddelivery/utils/Auth_Service.dart';
import 'package:fooddelivery/views/sellerpage.dart';
import 'package:get/route_manager.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backGround,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              color: ColorPalette.backGround,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                FirebaseAuth.instance.currentUser!.email!,
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
                                imageUrl: FirebaseAuth
                                    .instance.currentUser!.photoURL
                                    .toString()),
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
                                        color: Colors.grey.shade700,
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
                      onTap: () async {
                        await Constant.screensPageViewController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 10),
                            curve: Curves.easeInOut);
                        Constant.textFieldfocusNode.requestFocus();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                    child: Text(
                      "Wanna try these ?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
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
                ],
              )),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SellerSlider extends StatefulWidget {
  const SellerSlider({super.key});

  @override
  State<SellerSlider> createState() => _SellerSliderState();
}

class _SellerSliderState extends State<SellerSlider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Welcome>(
      future: GetHomeData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          final items = data.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                itemCount: items?.sellers.length,
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
                                imageUrl:
                                    items!.sellers[itemIndex].photo.toString()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0.sp),
                          child: Text(
                            items.sellers[itemIndex].name.toString(),
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: Text(
                  "Sellers in your college",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items!.sellers.length,
                itemBuilder: (
                  BuildContext context,
                  itemIndex,
                ) =>
                    InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      shadowColor: Colors.red,
                      elevation: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25.0.sp),
                                child: CachedNetworkImage(
                                    fit: BoxFit.contain,
                                    height: 100.h,
                                    width: 150.w,
                                    imageUrl: items.sellers[itemIndex].photo
                                        .toString()),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items.sellers[itemIndex].name.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(items.sellers[itemIndex].location
                                        .toString()),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(2.0),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(3, 0, 3, 0),
                                        child: Text(
                                          "Explore",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => SellerPage(
                          sellerName: items.sellers[itemIndex].name.toString(),
                          seller_id: items.sellers[itemIndex].index.toString(),
                        ));
                  },
                ),
              )
            ],
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
            ),
          );
        }
      },
    );
  }
}
