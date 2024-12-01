import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 var _formKey = GlobalKey<FormState>();
var _nameController = TextEditingController();
  var _ageController = TextEditingController();
  var Emailcontroller=TextEditingController();
  var Passwordcontroller=TextEditingController();
  bool password=true;
  bool ismale=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left_rounded),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person),
                      labelText: 'Name'
                     , border:OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                  SizedBox(height: 15,),
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

                  // DropdownButtonFormField<String>(
                  //   value: _selectedGender,
                  //   items: ['Male', 'Female', 'Other']
                  //       .map((gender) => DropdownMenuItem<String>(
                  //     value: gender,
                  //     child: Text(gender),
                  //   ))
                  //       .toList(),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _selectedGender = value!;
                  //     });
                  //   },
                  //   decoration: InputDecoration(labelText: 'Gender'),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                ismale = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ismale ? Colors.red : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  Image(
                                    image: AssetImage('assets/male.png'),
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'MALE',
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                ismale = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ismale ? Colors.grey[400] : Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('assets/female.png'),
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'FEMALE',
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_month),
                      labelText: 'Age',
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid age';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),

                  Container(
                    width:double.infinity,
                    decoration:BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadiusDirectional.circular(20),),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                           print(_nameController.text);
                         print( int.parse(_ageController.text));
                          print(Passwordcontroller.text);
                          print(Emailcontroller.text);
                          print( 'GENDER : ${ismale ? "Male" : "Female"}');

                          // ...
                        }
                      },
                      child: Text('Sign Up',style: TextStyle(color: Colors.white),),
                    ),
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