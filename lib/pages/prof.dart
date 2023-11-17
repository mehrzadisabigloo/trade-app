import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late String username;
  late String email;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          SharedPreferences sharedPreferences = snapshot.data!;
          username = sharedPreferences.getString("username") ?? "";
          email = sharedPreferences.getString("email") ?? "";
          return SafeArea(
            child: Column(
              children: [
                 SizedBox(
                  height: 120,
                  child: Center(
                      child: Text("Hi $username !",style: GoogleFonts.oswald(
                        fontSize: 30
                      ),
                      )
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration:  BoxDecoration(
                        color: Colors.blueGrey[900],
                        borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(110)
                      )
                    ),
                    width: width,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurple.shade500,
                            child: const Icon(Icons.person,size: 30,),
                          ),
                        ),
                        const SizedBox(height: 100,),
                        const Card(
                          child: ListTile(
                            leading: Icon(Icons.password),
                            title: Text("Change Your Password"),
                          ),
                        ),Card(
                          child:  ListTile(
                            leading: const Icon(Icons.email),
                            title: const Text("Email"),
                            subtitle: Text(email),
                          ),
                        )
                      ],
                    ),

                  ),
                )
              ],
            )
          );
        }
          return Center(
            child: LoadingAnimationWidget.threeArchedCircle(color: Colors.amber, size: 120),
          );
      },
    );
  }
}
