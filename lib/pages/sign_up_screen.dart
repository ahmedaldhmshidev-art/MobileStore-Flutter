// import 'package:flutter/material.dart';
// import 'package:myapplogin/fieldInput/InputField.dart';
// import 'package:myapplogin/fieldInput/my_app_bar.dart';
// import 'package:myapplogin/models/auth_service.dart';
// import 'package:myapplogin/utils/SizeOfConfig.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//
//   final emailController = TextEditingController();
//   final passController  = TextEditingController();
//
//
//   void _showMsg(String msg){
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }
//
//   void _register (){
//     final emailText = emailController.text.trim();
//     final passText = passController.text.trim();
//
//     if(emailText . isEmpty ){
//       _showMsg("email is empty");return;
//     }else if (passText . isEmpty){
//       _showMsg("password is empty");return;
//     }
//
//     final success = AuthService . register(emailText, passText);
//     if (success){
//       _showMsg("Create Success");
//       Navigator.pop(context);
//     }
//     else {
//      _showMsg("The Create exists!");
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: myAppBar ("Create new count"),
//       body: Padding(padding: EdgeInsets.all(16),
//       child: Column(
//         children: [
//           InputField(fieldController: emailController, label: "Email"),
//
//           SizedBox(height: 10,),
//
//           InputField(fieldController: passController, obscurePasswordText: true,  label: "Password"),
//
//           SizedBox(height: 20,),
//
//           Container(
//             width: getProportionalWidth(400),
//             child: ElevatedButton(onPressed: (){
//               _register();
//             },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.grey , foregroundColor: Colors.white),
//                 child: Text("Register" , style: TextStyle(fontWeight: FontWeight.bold),
//             )
//
//             ),
//           )
//         ],
//       ),
//       ),
//
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:myapplogin/fieldInput/InputField.dart';
import 'package:myapplogin/fieldInput/my_app_bar.dart';
import 'package:myapplogin/pages/login_screen.dart';
import 'package:myapplogin/utils/SizeOfConfig.dart';

import '../models/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _createAccount() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text;

      String? result = AuthService.createAccount(email, password);

      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم إنشاء الحساب بنجاح!',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.grey,
          ),
        );

        _emailController.clear();
        _passwordController.clear();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar('إنشاء حساب جديد'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputField(fieldController: _emailController, label: 'البريد الإلكتروني', preFixIcon: (Icons.email),
                validator:(value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال البريد الإلكتروني';
            }
            if (!AuthService.isValidEmail(value)) {
              return 'البريد الإلكتروني غير صالح';
            }
            return null;
          },
          ),

              SizedBox(height: getProportionalHeight(15)),

              InputField(fieldController:_passwordController , label: 'كلمة المرور', preFixIcon: (Icons.lock), obscurePasswordText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال كلمة المرور';
                  }
                  if (!AuthService.isValidPassword(value)) {
                    return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                  }
                  return null;
                },
              ),

              SizedBox(height: getProportionalHeight(24)),

              ElevatedButton(
                onPressed: _createAccount,

                child: Text('إنشاء حساب' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 15),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height:getProportionalHeight(10)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text(' سجل الدخول ', style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold),),
                    onTap:()
                    {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen() ) );
                    }
                  ),
                  Text('لديك حساب بالفعل؟ '),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
