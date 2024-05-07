import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sneakers/search_list.dart';
import 'package:sneakers/shoes.dart';

// var data;

stockX(String query, BuildContext context) async {
  var obj = Provider.of<searchList>(context, listen: false);
  obj.setLoading();
  obj.sneaks = [];
  const String url =
      "https://xw7sbct9v6-1.algolianet.com/1/indexes/products/query?x-algolia-agent=Algolia%20for%20vanilla%20JavaScript%203.32.1&x-algolia-application-id=XW7SBCT9V6&x-algolia-api-key=6b5e76b49705eb9f51a06d3c82f7acee";
  const headers = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36',
    "accept": "application/json",
    "accept-language": "en-US,en;q=0.9",
    "content-type": "application/x-www-form-urlencoded",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "cross-site"
  };
  var body = "{\"params\": \"query=$query\"}";
  var response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );
  Map<String, dynamic> data = jsonDecode(response.body);
  print(data['hits'][0]['price']);
  int n = data['hits'].length;
  // data['hits'][0].keys.forEach((key) {
  //   print(key);
  // });
  //add make and model
  for (int i = 0; i < n; i++) {
    // print(data['hits'][i]['url']);
    if (data['hits'][i]['product_category'] == 'sneakers') {
      Map<String, String> reply = await cdc(data['hits'][i]['url']);

      Shoes shoe = Shoes(
        id: data['hits'][i]['id'],
        name: data['hits'][i]['name'],
        brand: data['hits'][i]['brand'],
        image: data['hits'][i]['thumbnail_url'],
        price: data['hits'][i]['last_sale'].toString(),
        color: const Color(0xffbcbdc1),
        Colorway: data['hits'][i]['colorway'],
        description: data['hits'][i]['description'],
        style: data['hits'][i]['style_id'],
        releaseDate: data['hits'][i]['release_date'],
        make: data['hits'][i]['make'],
        model: data['hits'][i]['model'],
        shortDescription: data['hits'][i]['short_description'],
        cdc: reply,
      );
      // print(shoe.description);

      // print(shoe.toString());
      // sneaks.add(shoe);
      obj.add(shoe);
    }

    print(sneaks.length);
    // findYourKicks();
  }
  obj.removeLoading();
  obj.notify();
}

cdc(String query) async {
  List<String> splitted = query.split("-");
  String finalq = "";
  if (splitted[0] == "air") {
    splitted.removeAt(0);
    finalq = splitted.join("-");
  } else {
    finalq = query;
  }
  String url = "https://crepdogcrew.com/products/$finalq";
  print(url);
  const headers = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36',
    "accept": "application/json",
    "accept-language":
        "en-GB,en;q=0.9,gu-IN;q=0.8,gu;q=0.7,hi-IN;q=0.6,hi;q=0.5,en-US;q=0.4",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-origin",
  };
  var response = await http.get(Uri.parse(url), headers: headers);
  print(response.statusCode);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data["product"]["variants"][1]['option2']);
    print(data["product"]["variants"][1]['price']);
    // data['product'].keys.forEach((key) {
    //   print(key);
    // });
    Map<String, String> mp = {};
    List<dynamic> lst = data["product"]["variants"];
    for (var i in lst) {
      String s = i['option2'].split(" ")[1];
      // print(s);
      // print(i["price"]);
      mp[s] = i["price"];
    }
    // print(mp);
    return mp;
  } else {
    return {"none": "none"};
  }
}

// findYourKicks() async {
//   final url =
//       "https://findyourkicks.com/product/air-jordan-4-infrared?_rsc=jn7wo";
//   const headers = {
//     'User-Agent':
//         'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36',
//     "accept": "application/json",
//     "accept-language":
//         "en-GB,en;q=0.9,gu-IN;q=0.8,gu;q=0.7,hi-IN;q=0.6,hi;q=0.5,en-US;q=0.4",
//     "sec-fetch-dest": "empty",
//     "sec-fetch-mode": "cors",
//     "Rsc": '1',
//     "sec-fetch-site": "strict-origin-when-cross-origin",
//   };
//   var response = await http.get(Uri.parse(url), headers: headers);
//   print(response.body);
// }
