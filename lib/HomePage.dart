import 'dart:convert';
import 'package:apitask4/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Product_Modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];

  @override
  void initState() {
    getApiData();
    super.initState();
  }

  Future<List<ApiGetData>> getApiData() async {
    var result = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/"));
    if (result.statusCode == 200) {
      final List response = json.decode(result.body) as List;
      // print(response);
      List<ApiGetData> temp =
      response.map((e) => ApiGetData.fromJson(e)).toList();
      // print(temp);
      setState(() {
        data = temp;
        // print('refresh');
      });
      return temp;
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (data.isEmpty) {
    //   print('heer data ');
    // }
    // else{
    //   print('success ${data.length}');
    // }
    return Scaffold(
        appBar: AppBar(
          title: const Text("API Calling"),
        ),
        body: data.isNotEmpty
            ? Column(
                children:
                [
                  Expanded(
                      child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(demo: data[index]),
                              ));
                        },
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                        child: Text(data[index].id.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(data[index].username.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                        const SizedBox(height: 4),
                                        SizedBox(
                                            height: 20,
                                            child: Text(
                                                data[index].name.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12))),
                                        Text(data[index].email.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12)),
                                      ]),
                                ]),
                          ),
                        ),
                      );
                    },
                  )),
                ],
              )
            :
        const Center(
            child: CircularProgressIndicator())
    );
  }
}

