import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungrain/models/user_orders_model.dart';
import 'package:hungrain/services/APICalls.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserOrders>(
      future: GetUserOrderData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          final items = data.data;
          return ListView.builder(
            itemBuilder: (context, index1) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
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
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          "Rs ${items.orders[index1].price.toString()}",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w700),
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
                          ),
                        );
                      },
                      itemCount: items.orders[index1].items.length,
                      shrinkWrap:
                          true, // todo comment this out and check the result
                      physics:
                          const ClampingScrollPhysics(), // todo comment this out and check the result
                    ),
                    const Divider()
                  ],
                ),
              );
            },
            itemCount: items!.orders.length,
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
    );
  }
}
