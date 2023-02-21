import 'package:apitask4/ApiModal.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.demo}) : super(key: key);
  final ApiGetData demo;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(widget.demo.name.toString()),
              centerTitle: true,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.grey
              ,
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                             borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                                child: Text(widget.demo.id.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Center(
                              child: Text(widget.demo.username.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,color: Colors.white,
                                      fontSize: 20)),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(left: 25,top: 25,right: 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Phone Number",style: TextStyle(fontSize: 11,color: Colors.grey),),
                          const SizedBox(height: 4),
                          SizedBox(
                              height: 20,
                              child: Text(
                                  widget.demo.phone.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,fontWeight: FontWeight.bold))),
                          const SizedBox(height: 8),
                          const Text("Email",style: TextStyle(fontSize: 11,color: Colors.grey),),
                          const SizedBox(height: 4),
                          SizedBox(
                              height: 20,
                              child: Text(
                                  widget.demo.email.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,fontWeight: FontWeight.bold))),
                          const SizedBox(height: 8),

                          const Text("Address",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold),),

                          const SizedBox(height: 8),
                          const Text("street",style: TextStyle(fontSize: 11,color: Colors.grey),),
                          const SizedBox(height: 4),
                          Text(widget.demo.address!.street.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 8),
                          const Text("suite",style: TextStyle(fontSize: 11,color: Colors.grey),),
                          const SizedBox(height: 4),
                          Text(widget.demo.address!.suite.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),maxLines: 5,softWrap: true),
                          const SizedBox(height: 8),
                          const Text("city",style: TextStyle(fontSize: 11,color: Colors.grey),),
                          const SizedBox(height: 4),
                          Text(widget.demo.address!.city.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const Text("ZipCode",style: TextStyle(fontSize: 11,color: Colors.grey),),
                          const SizedBox(height: 4),
                          Text(widget.demo.address!.zipcode.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const Text("WebSite",style: TextStyle(fontSize: 11,color: Colors.grey),),
                          Text(widget.demo.website.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                        ]),
                  ),
                ],
              )
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 30),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.pinkAccent,
            onPressed: () {},
            isExtended: true,
            extendedPadding: EdgeInsets.all(MediaQuery.of(context).size.width /2.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            label: const Text("Submit",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
          ),
        ),
    )
    );
  }
}


