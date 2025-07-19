import 'package:flutter/material.dart';
import 'package:uni_chat/consts/text_field_in_form.dart';
import 'package:uni_chat/screens/auth/signin/components/signin_buttom_box.dart';
import 'package:uni_chat/screens/auth/signup/components/signup_buttom_box.dart';
import 'package:uni_chat/widgets/auth_widgets/user_have_account_or_not.dart';

// ignore: must_be_immutable
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(60)),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                MyTextFormField(
                  controller: email,
                  obscureText: false,
                  labelText: 'Email:',
                  hintText: 'Enter your email',
                  validatorText: 'Please enter your email',
                ),
                const SizedBox(height: 15),
                MyTextFormField(
                  controller: password,
                  obscureText: true,
                  labelText: 'Password:',
                  hintText: 'Enter your password',
                  validatorText: 'Please enter your password',
                ),
                const SizedBox(height: 20),
                ButtomBox(email: email, password: password, formKey: _formKey),
                const SizedBox(height: 10),
                const UserHaveAccountOrNot(nextPage: 'Sign Up'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(60)),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: isDark ? Colors.black : Colors.white),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text( 
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                MyTextFormField(
                  controller: email,
                  obscureText: false,
                  labelText: 'Email:',
                  hintText: 'Enter your email',
                  validatorText: 'Please enter your email',
                ),
                const SizedBox(height: 15),
                MyTextFormField(
                  controller: password,
                  obscureText: true,
                  labelText: 'Password:',
                  hintText: 'Enter your password',
                  validatorText: 'Please enter your password',
                ),
                const SizedBox(height: 20),
                SignUpButtonBox(
                  email: email,
                  password: password,
                  formKey: _formKey,
                ),
                const SizedBox(height: 10),
                UserHaveAccountOrNot(nextPage: 'Login'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
