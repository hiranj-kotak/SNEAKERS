import 'dart:typed_data';

import 'package:bitmap/bitmap.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ep.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/product_detail.dart';
import 'package:sneakers/profile_page.dart';
import 'package:sneakers/search_list.dart';
import 'package:sneakers/utils/apiCalls.dart';
import 'package:sneakers/utils/removebg.dart';
import './shoes.dart';

class HomePage extends StatefulWidget {
  static const RouteName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  bool flag = false;
  MemoryImage? img;
  List<String> queries = ["", "nike dunks", "Addidas", "puma", "Yeezys"];
  @override
  void initState() {
    stockX(queries[_currentIndex], context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<searchList>(context);
    print(obj.sneaks.length);
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Container(
        color: const Color(0xFFFAFAFA),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sneakers",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Profile.routeName);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SearchBar(
              controller: _searchController,
              onSubmitted: (Value) async {
                print(Value);
                await stockX(Value, context);
                setState(() {
                  _currentIndex = 0;
                });
              },
              backgroundColor:
                  const MaterialStatePropertyAll<Color>(Colors.white),
              shadowColor:
                  const MaterialStatePropertyAll<Color>(Color(0xFFDCDCDC)),
              elevation: const MaterialStatePropertyAll<double>(2),
              shape: const MaterialStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              leading: const Iconify(
                Ep.search,
                color: Colors.grey,
              ),
              hintText: "Search Jordans,Yeezys,off-Whites,etc...",
              hintStyle: const MaterialStatePropertyAll<TextStyle>(
                  TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  catagories(text: "All", index: 0),
                  const SizedBox(
                    width: 10,
                  ),
                  catagories(text: "Nike", index: 1),
                  const SizedBox(
                    width: 10,
                  ),
                  catagories(text: "Addidas", index: 2),
                  const SizedBox(
                    width: 10,
                  ),
                  catagories(text: "Puma", index: 3),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              // child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) => catagories(
              //         text: index == 0 ? "All" : queries[index], index: index),
              //     separatorBuilder: (context, index) {
              //       return const SizedBox(
              //         width: 10,
              //       );
              //     },
              //     itemCount: queries.length),
            ),
            const SizedBox(
              height: 20,
            ),
            obj.loading()
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: obj.sneaks.length,
                        itemBuilder: (context, index) {
                          // getImage(obj.sneaks[index].image);
                          // print(img);
                          return InkWell(
                            onTap: () {
                              // var ans = stockX("Trending-Sneakers");
                              // print(ans);
                              Navigator.pushNamed(
                                  context, ProductDetail.RouteNmae,
                                  arguments: {
                                    "product": obj.sneaks[index],
                                  });
                            },
                            child: Container(
                              // padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                // gradient: LinearGradient(
                                //   colors: [
                                //     Colors.white,
                                //     Colors.grey,
                                //   ],
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   transform: GradientRotation(1),
                                // ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(children: [
                                Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()..rotateY(3.14),
                                  child: Container(
                                    // color: Colors.red,
                                    // color: Colors.white,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      // image: flag == false
                                      //     ? null
                                      //     : DecorationImage(
                                      //         image: img!,
                                      //       ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            obj.sneaks[index].image),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Transform(
                                          transform: Matrix4.identity()
                                            ..rotateY(3.14),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "\$${obj.sneaks[index].price}",
                                            softWrap: true,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Color(0xFFDbdbdb),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Text(
                                          obj.sneaks[index].name,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Iconify(
                                              Ph.heart_straight_bold)),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }

  InkWell catagories({required String text, required int index}) {
    return InkWell(
      onTap: () {
        if (_currentIndex != index) {
          setState(() {
            _currentIndex = index;

            stockX(queries[_currentIndex], context);
          });
        }
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: _currentIndex == index
              // ? const Color(0xff79552f)
              ? Colors.black
              : const Color(0xFFd9d9d9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: _currentIndex == index ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
