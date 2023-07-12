//
// import 'dart:js';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/modules/News_app/web_view/web_view_screen.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/styles/icons_broken.dart';

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUperCase = true,
  required Function function,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: background,
      ),
      width: width,
      height: 40,
      child: MaterialButton(
        onPressed: () => function,
        child: Text(
          isUperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defulteFormFiled({
  TextEditingController? controller,
  required String label,
  required IconData prefix,
  Function? onSumbit,
  Function? onChange,
  Function? onTap,
}) =>
    TextFormField(
      onFieldSubmitted: (value) => onSumbit,
      onChanged: (value) => onChange,
      onTap: () {
        onTap;
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(style: BorderStyle.solid)),
        label: Text(label),
        prefixIcon: Icon(prefix),
      ),
    );

Widget bulidTaskItem() => Dismissible(
      key: Key(''),
      onDismissed: (direction) {
        //AppCubit.get(context).DeleteDate(id: 1);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              child: Text("02:00 PM"),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Task Titel ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text("2 Apr,2032 ",
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check_circle,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.archive_outlined,
                )),
          ],
        ),
      ),
    );

//${article['urlToImage']}

Widget BulidArticalItem(article, context) => InkWell(
      onTap: () {
        navigatorTo(context, webViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}')),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget ArticleBuilder(List, context, {IsSearch = false}) => ConditionalBuilder(
      condition: List.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              BulidArticalItem(List[index], context),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10),
      fallback: (context) =>
          IsSearch ? Container() : Center(child: (CircularProgressIndicator())),
    );

void navigatorTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

void ShowToast({required String Text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: Text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: ChooseCToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color? ChooseCToastColor(ToastStates state) {
  Color color;
  if (state == ToastStates.SUCCESS) {
    color = Colors.green;
  }
  if (state == ToastStates.ERROR) {
    color = Colors.red;
  }
  if (state == ToastStates.WARNING) {
    color = Colors.amber;
  }
}
