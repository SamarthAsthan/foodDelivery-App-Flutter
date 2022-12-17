import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/constants.dart';
import 'package:fooddelivery/models/user_orders_model.dart';
import 'package:fooddelivery/services/APICalls.dart';
import 'package:fooddelivery/utils/Auth_Service.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.backGround,
      child: SafeArea(
        child: FutureBuilder<UserOrders>(
          future: GetUserOrderData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text("${data.error}"),
              );
            } else if (data.hasData) {
              final items = data.data;
              return Column(children: [
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(
                        8.0,
                        10,
                        0,
                        0,
                      ),
                      child: Text(
                        "My Account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.red,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 65.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0.sp),
                          child: CachedNetworkImage(
                              height: 50.h,
                              imageUrl: FirebaseAuth
                                  .instance.currentUser!.photoURL
                                  .toString()),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FirebaseAuth.instance.currentUser!.displayName
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(FirebaseAuth.instance.currentUser!.email
                                .toString()),
                          ],
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Text(
                        "PAST ORDERS",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView.builder(
                    itemBuilder: (context, index1) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    items.orders[index1].seller.toString(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  "Rs ${items.orders[index1].price.toString()}",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            ListView.builder(
                              itemBuilder: (context, index2) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                  ),
                                  child: Text(
                                    "${items.orders[index1].items[index2].name} X ${items.orders[index1].items[index2].quantity}",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                );
                              },
                              itemCount: items.orders[index1].items.length,
                              shrinkWrap:
                                  true, // todo comment this out and check the result
                              physics:
                                  const NeverScrollableScrollPhysics(), // todo comment this out and check the result
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    },
                    itemCount: items!.orders.length,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: InkWell(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text("LOG OUT"),
                        const Spacer(),
                        const Icon(
                          Icons.logout_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () {
                      AuthService().signOut();
                    },
                  ),
                ),
              ]);
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
