//
// import 'package:flutter/material.dart';
// import 'package:myapplogin/fieldInput/my_app_bar.dart';
// import 'package:myapplogin/models/auth_service.dart';
// import 'package:myapplogin/pages/productApp.dart';
// import 'package:myapplogin/pages/sign_up_screen.dart';
// import 'package:myapplogin/utils/SizeOfConfig.dart';
// import '../fieldInput/InputField.dart';
//
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//
//   void _showMsg(String msg){
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }
//
//   void _login(){
//     final emailC = emailController.text.trim();
//     final passC  = passController.text.trim();
//     if(emailC . isEmpty ){
//       _showMsg("email is empty");return;
//     }else if (passC.isEmpty){
//       _showMsg("password is empty");return;
//     }
//
//     final success = AuthService . login(emailC, passC);
//
//     if(success){
//       Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) =>  ProductApp()),);
//     } else {
//  _showMsg("Error on email or password");
//   }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold
//       (
//         appBar:myAppBar("Login"),
//
//         body: Padding
//           (
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               //   اول حقل ادخال email تم استدعا التصميم باسم الكلاس
//               InputField(
//                 fieldController: emailController,
//                 label: "Email",
//               ),
//
//               SizedBox(height: 20,),
//               //   ثاني حقل ادخال password تم استدعا التصميم باسم الكلاس
//               InputField(
//                 fieldController: passController,
//                 label: "Password",
//                 obscurePasswordText: true,
//               ),
//               SizedBox(height: getProportionalHeight(30)),
//
//               Container(
//                   width: getProportionalWidth(400),
//                   child: ElevatedButton(
//                       onPressed: (){
//
//                         _login();
//                       },
//
//                       child: Text("Login" , style: TextStyle(fontWeight: FontWeight.bold),),
//                       style: ElevatedButton.styleFrom
//                         (
//                         backgroundColor: Colors.black12,
//                         foregroundColor: Colors.white ,
//                       )
//                   )
//               ),
//               SizedBox(height: getProportionalHeight(30)),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("If you don't have an count ?  "),
//                   InkWell(
//                     child: Text("Sign Up" , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold), ),
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder:(_) => RegisterScreen()),);
//                     },
//                   )
//                 ],
//               )
//             ],),
//
//         )
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:myapplogin/fieldInput/InputField.dart';
import 'package:myapplogin/fieldInput/my_app_bar.dart';
import 'package:myapplogin/pages/productApp.dart';
import 'package:myapplogin/pages/sign_up_screen.dart';
import 'package:myapplogin/utils/SizeOfConfig.dart';

import '../models/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController    = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email    = _emailController   .text.trim();
      String password = _passwordController.text;

      bool loginSuccess = AuthService.login(email, password);

      if (loginSuccess) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductApp()), );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('البريد الإلكتروني أو كلمة المرور غير صحيحة' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold ,),),
            backgroundColor: Colors.red,

          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("تسجيل الدخول"),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputField(fieldController:  _emailController, label:'البريد الإلكتروني', preFixIcon:(Icons.email) ,
                validator:(value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال البريد الإلكتروني';
                }
                return null;
              } ,),


              SizedBox(height:getProportionalHeight(16)),

              InputField(fieldController:_passwordController, label:'كلمة المرور', preFixIcon: (Icons.lock), obscurePasswordText: true,
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال كلمة المرور';
                }
                return null;
              },),

              SizedBox(height: getProportionalHeight(16)),


              ElevatedButton(
                onPressed: _login,

                child: Text('تسجيل الدخول', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  // form to width full
                  minimumSize: Size(double.infinity, 50),
                ),
              ),

              SizedBox(height:getProportionalHeight(10)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text('انشاء حساب ' , style: TextStyle(color: Colors.blueAccent , fontWeight: FontWeight.bold),),
                    onTap: ()
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()),);
                    },
                  ),

                  Text(' ليس لديك حساب؟  '),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

