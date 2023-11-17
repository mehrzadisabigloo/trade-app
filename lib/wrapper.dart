import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_app/bloc/home_page_bloc.dart';
import 'package:trade_app/pages/prof.dart';
import 'package:trade_app/pages/setting.dart';
import 'bottomnav.dart';
import 'pages/home.dart';

class warp extends StatefulWidget {

  const warp({super.key});

  @override
  State<warp> createState() => _warpState();
}

class _warpState extends State<warp> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),onPressed: (){},child: const Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(pageController: pageController,),

      body: PageView(
        controller:pageController ,
        children:  [
          BlocProvider<HomePageBloc>(
            create: (context) => HomePageBloc(),
            child: const HomePage(),
),
            const ProfilePage(),
            const Sett(),
            const Sett(),
            // const SignUpScreen()
        ],
      ),
    );
  }
}
