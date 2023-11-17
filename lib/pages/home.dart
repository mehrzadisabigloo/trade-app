import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var defaultindex = 0;
  PageController pageController = PageController(initialPage: 0);

  List<String> chips = ["Top marketcaps","Top gainers","Top losers"];
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomePageBloc>(context).add(EventOne());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
                    // color: Colors.amber,
                    child: Stack(

                      children: [
                        PageView(
                          controller: pageController,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: const Image(
                                    image:AssetImage("assets/images/a1.png"),
                                    fit: BoxFit.fill
                                )
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: const Image(
                                    image:AssetImage("assets/images/a2.png"),
                                    fit: BoxFit.fill
                                )
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: const Image(
                                    image:AssetImage("assets/images/a3.png"),
                                    fit: BoxFit.fill
                                )
                            ),
                          ],
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              onDotClicked: (index){
                                pageController.animateToPage(index, duration: const Duration(seconds: 1), curve: Curves.easeIn);
                              },
                              effect: const ExpandingDotsEffect(
                                  dotWidth: 10,
                                  dotHeight: 10,
                                  dotColor: Colors.white,
                                  activeDotColor: Colors.amber
                              ),
                            ),
                          ),
                        )
                      ],


                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Marquee(text: "this is hourly news     "),

                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 7),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[700],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: const EdgeInsets.only(top: 20,bottom: 20)
                            ), child: const Text("buy"),
                          )
                      ),
                      Container(
                        width: 10,
                      ),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[700],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: const EdgeInsets.only(top: 20,bottom: 20)
                            ), child: const Text("sell"),
                          )
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<HomePageBloc, HomePageState>(
                          builder: (context, state) {
                            if(state is Loaded || state is Loading){
                              return Wrap(
                                  spacing: 7,
                                  children:
                                  List.generate(
                                      chips.length, (index) {
                                    return ChoiceChip(
                                      label: Text(chips[index]
                                      ),
                                      selected:defaultindex == index,
                                      selectedColor: Colors.brown[800],
                                      elevation: 7,
                                      onSelected: (value){
                                        switch(index){
                                          case 0:
                                            BlocProvider.of<HomePageBloc>(context).add(EventOne());
                                            defaultindex = 0;
                                            break;
                                          case 1:
                                            BlocProvider.of<HomePageBloc>(context).add(EventTwo());
                                            defaultindex = 1;
                                            break;
                                          case 2:
                                            BlocProvider.of<HomePageBloc>(context).add(EventThree());
                                            defaultindex = 2;
                                            break;
                                        }


                                      },
                                    );

                                  }
                                  )

                              );
                            }

                            return const Center();
  }
)
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 0,
                // ),
                BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    if(state is Loading){

                      return SizedBox(
                        // color: Colors.amber,
                        height: MediaQuery.of(context).size.height,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white10,
                          child: ListView.builder(
                            itemBuilder: (context, index){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10,left: 10,top: 10),
                                    child: CircleAvatar(
                                      radius: 30,

                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                          color: Colors.white
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );

                            },
                            itemCount: 5,
                          ),
                        ),
                      );
                    }

                    if(state is Loaded){
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height/2,
                          child: ListView.separated(
                              itemCount: state.cryptolist.length,
                              itemBuilder: (context,index){
                                return Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)
                                      )
                                  ),
                                  // color: Colors.grey[800],
                                  child:ListTile(
                                    title: Row(
                                      children: [
                                        // CachedNetworkImage(
                                        //     imageUrl: "https://s2.coinmarketcap.com/static/img/coins/32x32/${state.cryptolist[index].id}.png",
                                        //   height: 30,
                                        //   width: 30,
                                        //     placeholder: (context, url) => const CircularProgressIndicator(),
                                        //   errorWidget: (context, url,error){
                                        //       return const Icon(Icons.error);
                                        //   }
                                        // ),
                                        Text((index+1).toString()),
                                        Image.network("https://s2.coinmarketcap.com/static/img/coins/32x32/${state.cryptolist[index].id}.png",width: 40,height: 40,),
                                        Flexible(fit: FlexFit.tight,child: Text(state.cryptolist[index].name.toString()))
                                      ],
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Text(state.cryptolist[index].symbol.toString()),
                                    ),

                                    trailing: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(state.cryptolist[index].quotes![0].price.toString()),
                                        const Text("USD")
                                      ],
                                    ),
                                  )
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [Container(height: 2,width: 260,color: Colors.brown[700],)],
                                );
                          },
                          ),
                        ),
                      );
                    }

                    return Container();
                  },
                )

              ],
            ),
          ),
        )
    );
  }
}
