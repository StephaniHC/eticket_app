import 'package:eticket_app/provider/login_form_provider.dart';
import 'package:eticket_app/ui/input_decorations.dart';
import 'package:eticket_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class LoginScreen extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox( height: 250),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox( height: 10),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm()
                    ),
                    

                  ],
                )
              ), 
            ],
          ),
        )
      )
    );
  }
} 
class _LoginForm extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'pepito@gmail.com',
                labelText: 'Email',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: ( value )=> loginForm.email = value,
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                  ?null
                  : 'Ingresar Email'
                ;
              },
            ),
            SizedBox( height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*********',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: ( value )=> loginForm.password = value,
              validator: (value){
                return ( value != null && value.length >= 9) 
                ? null
                : 'la contraseña debe ser de 9 caracteres';
              },
            ), 
            SizedBox( height: 30), 
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.blueAccent,
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading
                    ? 'Espere'
                    :'Ingresar',
                  style: TextStyle( color: Colors.white ),
                ),
              ),
              onPressed: loginForm.isLoading? null: () async{
                FocusScope.of(context).unfocus();
                if (!loginForm.isValidForm()) return;
                loginForm.isLoading = true;
                await Future.delayed(Duration(seconds: 2));
                loginForm.isLoading = false;
                Navigator.pushReplacementNamed(context, 'eventos');
              },
            )
          ],
        ),
      ),
    );
  }
}