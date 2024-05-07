import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloudimage_360_view/cloudimage_360_view.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/home.dart';
import 'package:sneakers/search_list.dart';
import 'package:sneakers/shoes.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sneakers/utils/apiCalls.dart';

class ProductDetail extends StatefulWidget {
  static const RouteNmae = "/product_detail";
  ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentIndex = 0;
  String _currentPrice = "0";
  Shoes? product;
  List<String> sizes = [
    "7",
    "8",
    "9",
    "9.5",
    "10",
    "10.5",
    "11",
    "11.5",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(
      context,
    )!
        .settings
        .arguments as Map<String, Shoes>;
    product = args['product'] as Shoes;
    // TODO: implement initState
    sizes = product!.cdc.keys.toList();
    _currentPrice = product!.cdc[sizes[_currentIndex]]!;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  String dropdownvalue = "all";

  @override
  Widget build(BuildContext context) {
    print(product!.shortDescription);
    // stockX("green glow", context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                            },
                            icon: const Icon(Icons.share),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                            },
                            icon: const Icon(Icons.add_circle_outline_sharp),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        product!.make,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        product!.model,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width,
                    child: Ci360View(
                      xImageModel: Ci360ImageModel.horizontal(
                        imageFolder:
                            "https://images.stockx.com/360/${product!.shortDescription}/Images/${product!.shortDescription}/Lv2/",
                        imageName: (index) =>
                            index < 10 ? "img0$index.jpg" : "img$index.jpg",
                        imagesLength: 35,
                      ),
                      options: Ci360Options(
                        swipeSensitivity: 1,
                        autoRotate: false,
                        rotationCount: 0,
                        allowSwipeToRotate: true,
                        rotationDirection: CIRotationDirection.clockwise,
                        onImageChanged: (index, reason, axis) {},
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 50,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (conext, index) => Container(
                          height: 50,
                          child: catagories(text: sizes[index], index: index)),
                      itemCount: sizes.length,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Product Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        productdet(context, "Style", product!.style),
                        const SizedBox(
                          height: 10,
                        ),
                        productdet(context, "Colorway", product!.Colorway),
                        const SizedBox(
                          height: 10,
                        ),
                        productdet(context, "Retail price", product!.price),
                        const SizedBox(
                          height: 10,
                        ),
                        productdet(
                            context, "Release Date", product!.releaseDate),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Product Description",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: HtmlWidget(
                      ''' ${product!.description}''',
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width *
                                          0.98,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Rs.$_currentPrice",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "\$${product!.price}",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline,
                      size: 30,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Row productdet(BuildContext context, String title, String detail) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            detail,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  InkWell catagories({required String text, required int index}) {
    return InkWell(
      onTap: () {
        if (_currentIndex != index) {
          setState(() {
            _currentIndex = index;
            _currentPrice = product!.cdc[sizes[_currentIndex]]!;
          });
        }
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black)),
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
