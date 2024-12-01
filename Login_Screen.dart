import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ismailconnectx/Sign_Up.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}
class _Login_screenState extends State<Login_screen> {
  var Emailcontroller=TextEditingController();
  var Passwordcontroller=TextEditingController();
  bool password=true;
  bool saveLogin = false;
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    validator: (value){
                      if(value!=null&& value.isEmpty)
                        return 'Email can\'t be empty';
                      return null;
                    },
                    decoration: InputDecoration(
                      label:Text("Email"),
                      prefixIcon: Icon(Icons.email_outlined),
                        border:OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20)))
                    ),
                    controller:Emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value){
                      if(value!=null&& value.isEmpty)
                        return 'Password can\'t be empty';
                      return null;
                    },
                    decoration: InputDecoration(
                      border:OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
                      label:Text("Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon:IconButton(icon:password==true? Icon(Icons.remove_red_eye_rounded):Icon(Icons.visibility_off_rounded),
                        onPressed: (){
                        setState(() {
                         password=!password;
                        });
                      },),
                    ),
                    controller: Passwordcontroller,
                    keyboardType: TextInputType.text,
                    obscureText: password,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(
                        value: saveLogin,
                        onChanged: (value) {
                          setState(() {
                            saveLogin = value!;
                          });
                        },
                      ),
                      Text("Save Login"),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width:double.infinity,
                    decoration:BoxDecoration(
                      color: Colors.red,
              borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: MaterialButton(child:
                    Text('Login',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        onPressed: (){

                      if(formkey.currentState!.validate()){
                        print(Emailcontroller.text);
                      print(Passwordcontroller.text);}
                      print('Save Login: $saveLogin');
                        }
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()),
                          );
                        },
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
