import 'package:flutter/material.dart';
import 'package:news_app/providers/news_api_helper.dart';
import 'package:news_app/utils/globals.dart';
import 'package:news_app/views/detail_screen/detail_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../modals/news.dart';

class FetchDataScreen extends StatefulWidget {
  FetchDataScreen({Key? key, required this.data}) : super(key: key);

  String data;

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  late Future<List<News>> newsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsList = NewsAPIHelper.newsAPIHelper.fetchNewsData(category: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            height: 580,
            width: 400,
            child: FutureBuilder(
              future: newsList,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<News>? data = snapshot.data;
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(news: data[i]),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                            height: 130,
                            width: double.infinity,
                            // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            // color: Colors.purple,
                            color: Theme.of(context).primaryColor,

                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              // color: Colors.purple,,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 130,
                                        width: 215,

                                        padding: const EdgeInsets.only(right: 5),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "${data[i].name}: ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).splashColor,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "${data[i].title}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).primaryColorDark,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 115,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: NetworkImage("${data[i].image}"), fit: BoxFit.cover),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return ListView.builder(
                  itemCount: dummyList.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 3,
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        // color: Colors.purple,
                        // color: Theme.of(context).primaryColorDark,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 130,
                                    width: 215,
                                    padding: const EdgeInsets.only(right: 5),
                                    // color: Colors.amber,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "${dummyList[i]["text1"]}: ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).splashColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${dummyList[i]["text2"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).primaryColorDark,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 115,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
