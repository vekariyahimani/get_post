import 'package:flutter/material.dart';
import 'package:get_post/screen/provider/home_provider.dart';
import 'package:get_post/screen/view/get_screen.dart';
import 'package:get_post/screen/view/post_screen.dart';
import 'package:provider/provider.dart';


void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => PostScreen(),
          'get':(context) => GetScreen(),

        },
      ),
    )
  );
}