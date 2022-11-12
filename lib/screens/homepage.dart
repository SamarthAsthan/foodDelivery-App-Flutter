import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 45,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 3),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Vellore Institute of Technology",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              const Text(
                                "Kelambakkam - Vandalur Rd",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: CachedNetworkImage(
                                imageUrl:
                                    "https://media-exp1.licdn.com/dms/image/C4D03AQH7nD5jgTYpUw/profile-displayphoto-shrink_800_800/0/1661285518630?e=2147483647&v=beta&t=qFFwNCo54W05xYCW3Vx3_OjzdYw2oAtFwo4filNvnxg"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.06),
                          border: Border.all(color: Colors.grey, width: 0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  "Search 'Pizza'",
                                  style: TextStyle(
                                      fontSize: 15,
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
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
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
                            height: 70,
                            width: 70,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
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
                            height: 70,
                            width: 70,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
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
                            height: 70,
                            width: 70,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
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
                  const SizedBox(
                    height: 10,
                  ),
                  const SellerSlider(),
                  const SizedBox(
                    height: 10,
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
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                child: Center(
                    child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                            imageUrl: items[itemIndex].image.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        items[itemIndex].name.toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
              height: 200.0,
            ),
          );
        } else {
          return SizedBox(
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CupertinoActivityIndicator(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
              height: 160,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      15,
                      0,
                      15,
                      0,
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
                                  height: 20,
                                  width: 20,
                                  child: itemIndex % 2 == 0
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          child: CachedNetworkImage(
                                              imageUrl:
                                                  "https://rukminim1.flixcart.com/image/40/40/k7usyvk0/nut-dry-fruit/z/d/h/500-organic-cashews-mason-jar-cost-2-cost-original-imafpzw5tskvyvpe.jpeg?q=90"),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          child: CachedNetworkImage(
                                              imageUrl:
                                                  "https://newasianvillagedelivery.com/assets/restaurantcmswebsite/images/nv-icon.jpg"),
                                        ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade400,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(2.0),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      "Best Selling",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              items[itemIndex].name.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const Text(
                              "Rs 100",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: 230,
                              child: Text(
                                items[itemIndex].description.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(.09),
                                height: 120,
                                width: 120,
                              ),
                              CachedNetworkImage(
                                height: 100,
                                width: 100,
                                imageUrl: items[itemIndex].image.toString(),
                              ),
                              SizedBox(
                                height: 140,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade400,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(2.0),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ADD +",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
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
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CupertinoActivityIndicator(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Please wait."),
                  )
                ],
              ));
        }
      },
    );
  }
}
