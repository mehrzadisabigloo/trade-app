import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_app/wrapper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey  = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController gmail = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    gmail.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Lottie.asset(
            "assets/images/waveloop.json",
            width: double.infinity,
              height: 200,
            fit: BoxFit.fill

          ),
          const SizedBox(height: 10,),
          Container(
            width: width*0.5,
            height: 2,
            color: Colors.brown[500],
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text("Sign Up",
              style: GoogleFonts.ubuntu(
                fontSize: 30,
                fontWeight: FontWeight.w800
              )
            ),
          ),
          const SizedBox(height: 6,),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text("Create account",
                style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    // fontWeight: FontWeight.w600
                )
            ),
          ),
          const SizedBox(height: 17,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Form(
              key: _formkey,
                child:Column(
                  children: [
                    TextFormField(
                      controller: username,
                      cursorColor: Colors.amber,

                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        ),

                          hintText: "username",
                        prefixIcon: Icon(Icons.person),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                      ),

                      validator: (text){
                        if(text!.isEmpty){
                          return "Enter username";
                        }
                        if(text.length < 5){

                          return "username is too short";
                        }
                        return null;

                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller:gmail ,
                      cursorColor: Colors.amber,

                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),

                          hintText: "gmail",
                          prefixIcon: Icon(Icons.email),

                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                      ),

                      validator: (text){
                        if(text!.isEmpty){
                          return "Enter gmail";
                        }
                        if(!text.endsWith("@gmail.com")){

                          return "your gmail is not valid";
                        }
                        return null;

                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller:password ,
                      cursorColor: Colors.amber,
                      obscureText:isObscure ,
                      decoration:  InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),

                          hintText: "password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off)),

                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                      ),

                      validator: (text){
                        if(text!.isEmpty){
                          return "Enter password";
                        }
                        return null;

                      },
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: width,
                      height: 55,
                      child:ElevatedButton(
                          onPressed: () async {
                            if(_formkey.currentState!.validate()){
                              await shred();
                              // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainWrapper())));
                              WidgetsBinding.instance.addPostFrameCallback((timeStamp) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const warp())));
                              // Navigator.pushReplacementNamed(context, '/wrapper');
                            }
                          },
                          child: const Text("Sign Up")
                      )
                    )

                  ],
                )
            ),
          ),


        ],
      ),
    );
  }

  Future<void> shred()async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", true);
    prefs.setString("username", username.text);
    prefs.setString("email", gmail.text);
  }




}
