import 'package:e_commerce_mobile/model/user_login_dto.dart';
import 'package:e_commerce_mobile/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/auth_service.dart';
import '../../util/reusable_textfield.dart';
import '../../util/snackbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final authService = AuthService();

    void handleLogin(BuildContext context) async {
      final dto = UserLoginDto(
        userName: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      final response = await authService.login(dto);

      if (response == null) {
        showSnackBar(context, "Login failed. Please try again.");
        return;
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', response.token);

      if (response.roles.contains("ADMIN") ||
          response.roles.contains("STORE_MANAGER")) {
        showSnackBar(context, "Welcome ${response.username}!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      }else{
        showSnackBar(context, "Access denied! Only admins and store owners can log in.");
        return;
      }
    }

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
                controller: usernameController,
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
                controller: passwordController,
                maxLines: 1,
                isPassword: true
              ),
              const SizedBox(height: 30.0,),
              InkWell(
                onTap: (){
                  handleLogin(context);
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
