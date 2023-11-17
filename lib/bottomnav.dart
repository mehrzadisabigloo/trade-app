
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final PageController pageController;
  const BottomNav({super.key,required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),

      notchMargin: 5,
      height: 60,
      color: Colors.black26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/2-20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  pageController.animateToPage(0, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);

                }, icon: const Icon(Icons.home)),
                IconButton(onPressed: (){
                  pageController.animateToPage(1, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);

                }, icon: const Icon(Icons.person))
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/2-20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  pageController.animateToPage(2, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);

                }, icon: const Icon(Icons.settings)),
                IconButton(onPressed: (){
                  pageController.animateToPage(3, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);

                }, icon: const Icon(Icons.assignment_ind_outlined)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

