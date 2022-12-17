import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/constants.dart';
import 'package:fooddelivery/services/APICalls.dart';

class SellerPage extends StatelessWidget {
  const SellerPage(
      {super.key, required this.sellerName, required this.seller_id});

  final String sellerName, seller_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        title: Text(sellerName),
      ),
      body: Container(
        height: double.infinity,
        color: ColorPalette.backGround,
        child: FutureBuilder(
          future: GetSellerPageData(seller_id),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text("${data.error}"),
              );
            } else if (data.hasData) {
              final items = data.data;
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          CachedNetworkImage(
                              imageUrl:
                                  "https://www.cypressgreen.in/blog/wp-content/uploads/2021/03/food.jpg"),
                          Container(
                            height: 212.h,
                            width: double.infinity,
                            color: Colors.black.withOpacity(.6),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: CachedNetworkImage(
                                      height: 100.h,
                                      width: 100.w,
                                      imageUrl: items!.photo),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                    Text(
                                      items.email,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                    Text(
                                      items.location,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                        child: Text(
                          "Items-",
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.items.length,
                        itemBuilder: (
                          BuildContext context,
                          itemIndex,
                        ) =>
                            SizedBox(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15.h,
                                              width: 15.w,
                                              child: itemIndex % 2 == 0
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0.sp),
                                                      child: CachedNetworkImage(
                                                          imageUrl:
                                                              "https://rukminim1.flixcart.com/image/40/40/k7usyvk0/nut-dry-fruit/z/d/h/500-organic-cashews-mason-jar-cost-2-cost-original-imafpzw5tskvyvpe.jpeg?q=90"),
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0.sp),
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
                                                  items.items[itemIndex].name
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 210,
                                          child: Text(
                                            items.items[itemIndex].name
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          "Rs ${items.items[itemIndex].price}",
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(5.0.sp),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            color: Colors.grey.withOpacity(.09),
                                            height: 90.h,
                                            width: 90.w,
                                          ),
                                          CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            height: 90.h,
                                            width: 90.w,
                                            imageUrl: items
                                                .items[itemIndex].photo
                                                .toString(),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(2.0.sp),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(2.0.sp),
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
                      )
                    ]),
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
                      child: const Text("Please wait."),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
