import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Sett extends StatefulWidget {
  const Sett({super.key});

  @override
  State<Sett> createState() => _HomePageState();
}

class _HomePageState extends State<Sett> {
  late String pref = "Te";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Form(
                child: TextField(

                  onSubmitted: (value){
                    pref = value;
                  },

                  decoration: InputDecoration(
                    hintText: "hi",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide( color: Colors.red)
                    ),
                  ),

                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  sendRequestCitySuggestion(pref);
                },
                child: Text("hi")
            )
          ],
        ),
      ),
    );
  }
  Future<dynamic> sendRequestCitySuggestion(String prefix) async {
    var response = await Dio().get(
        "http://geodb-free-service.wirefreethought.com/v1/geo/cities",
        queryParameters: {'limit': 7, 'offset': 0, 'namePrefix': prefix}
    );
    print(response.data);

    return response;
  }
}