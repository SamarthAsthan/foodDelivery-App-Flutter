// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/constants.dart';
import 'package:fooddelivery/services/APICalls.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  String searchQuery = "";
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    Constant.textFieldfocusNode.dispose();
    Constant.textFieldcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 5.h),
              child: Container(
                height: 35.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.06),
                    border: Border.all(color: Colors.grey, width: 0.w),
                    borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              searchQuery = text;
                            });
                          },
                          focusNode: Constant.textFieldfocusNode,
                          controller: Constant.textFieldcontroller,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 5, bottom: 5, top: 15, right: 10),
                              hintText: "Search 'Pizza'",
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.w700)),
                        ),
                      ),
                      if (searchQuery == "")
                        const Icon(
                          Icons.search,
                          color: Colors.red,
                        )
                      else if (searchQuery == "null")
                        const Icon(
                          Icons.search,
                          color: Colors.red,
                        )
                      else
                        InkWell(
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              Constant.textFieldcontroller.clear();
                              searchQuery = "null";
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (searchQuery == "")
              Flexible(child: Center(child: Text("Search Somthing")))
            else if (searchQuery == "null")
              Flexible(child: Center(child: Text("Search Somthing")))
            else
              Flexible(
                child: FutureBuilder(
                  future: GetSearchData(searchQuery),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      //print(snapshot.data!.results![0].name);
                      return SingleChildScrollView(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: snapshot.data!.results!.length,
                          itemBuilder: (
                            BuildContext context,
                            itemIndex,
                          ) =>
                              Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    15.w,
                                    5.h,
                                    15.w,
                                    5.h,
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
                                                            BorderRadius
                                                                .circular(
                                                                    2.0.sp),
                                                        child: CachedNetworkImage(
                                                            imageUrl:
                                                                "https://rukminim1.flixcart.com/image/40/40/k7usyvk0/nut-dry-fruit/z/d/h/500-organic-cashews-mason-jar-cost-2-cost-original-imafpzw5tskvyvpe.jpeg?q=90"),
                                                      )
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(2.0.sp),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(2.0.sp),
                                                  child: Text(
                                                    snapshot
                                                        .data!
                                                        .results![itemIndex]
                                                        .name
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
                                              snapshot.data!.results![itemIndex]
                                                  .name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Text(
                                            "Rs ${snapshot.data!.results![itemIndex].price}",
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
                                              color:
                                                  Colors.grey.withOpacity(.09),
                                              height: 90.h,
                                              width: 90.w,
                                            ),
                                            CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              height: 90.h,
                                              width: 90.w,
                                              imageUrl: snapshot.data!
                                                  .results![itemIndex].photo
                                                  .toString(),
                                            ),
                                            SizedBox(
                                              height: 99.h,
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
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
                                                      alignment:
                                                          Alignment.center,
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
                              ],
                            ),
                          ),
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
                              child: const Text("Please wait."),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
