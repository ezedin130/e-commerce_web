import 'package:e_commerce_mobile/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/reusable_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              Text(
                'Sign in to your account to continue',
                style: GoogleFonts.lato(
                    fontSize: 15,
                    color: Colors.black45
                ),
              ),
              const SizedBox(height: 20.0,),
              Text(
                'Username',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87
                ),
              ),
              const SizedBox(height: 5.0,),
              ReUsableTextfield(
                text: 'username',
                obscure: false,
                icon: Icons.mail,
              ),
              const SizedBox(height: 20.0,),
              Text(
                'Password',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87
                ),
              ),
              const SizedBox(height: 5.0,),
              ReUsableTextfield(
                  text: '........',
                  obscure: true,
                  icon: Icons.lock,
                isPassword: true
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  ),
                  value: 'STORE OWNER',
                  items: ['STORE OWNER', 'ADMIN']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (_) {},
                ),
              ),
              const SizedBox(height: 30.0,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
