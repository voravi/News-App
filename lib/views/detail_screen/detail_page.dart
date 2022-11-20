import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modals/news.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key,required this.news}) : super(key: key);

  News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).highlightColor,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios_rounded),color: Theme.of(context).primaryColorDark,),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${news.name!}: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).splashColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      "${news.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: (news.image == null) ? Container() : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        news.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${news.content}: ",
                          style: TextStyle(
                            letterSpacing: 1.5,
                            wordSpacing: 1,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: "${news.description}",
                          style: TextStyle(
                            letterSpacing: 1.5,
                            wordSpacing: 1,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                            text: "\n\n"
                        ),
                        TextSpan(
                          text: "${news.content}: ",
                          style: TextStyle(
                            letterSpacing: 1.5,
                            wordSpacing: 1,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: "\n\n"
                        ),
                        TextSpan(
                          text: "${news.description}",
                          style: TextStyle(
                            letterSpacing: 1.5,
                            wordSpacing: 1,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
