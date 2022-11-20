import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/home_screen/detail_home_page.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).highlightColor,
        title: Text(
          "Daily News",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_rounded,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: Icon(
              Icons.brightness_6_sharp,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          labelPadding: EdgeInsets.only(bottom: 10, right: 15, left: 15, top: 10),
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.grey,
          overlayColor: MaterialStateProperty.resolveWith((states) => Colors.grey.withOpacity(0.3)),
          // splashBorderRadius: BorderRadius.circular(10),
          onTap: (val) {
            tabController.animateTo(val);
          },
          tabs: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.model_training_rounded,
                ),
                SizedBox(width: 5,),
                Text("General",style: TextStyle(fontWeight: FontWeight.bold,),),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                ),
                SizedBox(width: 5,),
                Text("Business",style: TextStyle(fontWeight: FontWeight.bold,),),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.movie_creation_outlined,
                ),
                SizedBox(width: 5,),
                Text("Entertainment",style: TextStyle(fontWeight: FontWeight.bold,),),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.health_and_safety_outlined,
                ),
                SizedBox(width: 5,),
                Text("Health",style: TextStyle(fontWeight: FontWeight.bold,),),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.science_outlined,
                ),
                SizedBox(width: 5,),
                Text("Science",style: TextStyle(fontWeight: FontWeight.bold,),),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sports_baseball_outlined,
                ),
                SizedBox(width: 5,),
                Text("Sports",style: TextStyle(fontWeight: FontWeight.bold,),),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.biotech,
                ),
                SizedBox(width: 5,),
                Text("Technology",style: TextStyle(fontWeight: FontWeight.bold,),),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          FetchDataScreen(data: "general"),
          FetchDataScreen(data: "business"),
          FetchDataScreen(data: "entertainment"),
          FetchDataScreen(data: "health"),
          FetchDataScreen(data: "science"),
          FetchDataScreen(data: "sports"),
          FetchDataScreen(data: "technology"),
        ],
      ),
    );
  }
}
