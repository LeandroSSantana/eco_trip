// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_telas/services/autenticacao_servico.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKeyFullName = GlobalKey<FormState>();
  final formKeyEmail = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();

  final AutenticacaoServico _autenServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFdcdcdc),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  // logo
                  SvgPicture.asset(
                    'images/logo.svg',
                    width: 120,
                    height: 120,
                    color: Color(0xFF1F4AC2),
                  ),
                  // logotipo
                  Text(
                    'Ecotrip',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Roboto-Regular',
                      color: Color(0xFF1F4AC2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //frase
                  RichText(
                    text: TextSpan(
                      text: 'Viaje mais, ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontFamily: 'Roboto-Regular',
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Gaste menos!',
                          style: TextStyle(
                            color: Color(0xFF1F4AC2),
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // nome completo
                  Container(
                      margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                      child: Form(
                        key: formKeyFullName,
                        child: TextFormField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Nome Completo',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          // Adicione outras propriedades de estilo, se necessário
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo é obrigatório';
                            }
                            return null;
                          },
                        ),
                      )),
                  const SizedBox(height: 10),
                  // email
                  Container(
                      margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                      child: Form(
                        key: formKeyEmail,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: ' E-mail',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          // Adicione outras propriedades de estilo, se necessário
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira um e-mail';
                            } 
                            return null;
                          },
                        ),
                      )),
                  const SizedBox(height: 10),
                  // senha
                  Container(
                      margin: EdgeInsets.fromLTRB(44, 15, 44, 0),
                      child: Form(
                        key: formKeyPassword,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha';
                            } else if (value.length < 6) {
                              return 'a senha deve conter pelo menos de 6 digitos!';
                            }
                            return null;
                          },
                        ),
                      )),
                  const SizedBox(height: 10),
                  const SizedBox(height: 50),
                  // button registre-se
                  Container(
                    child: CupertinoButton(
                      onPressed: () async {
                        if (formKeyFullName.currentState!.validate() &&
                            formKeyEmail.currentState!.validate() &&
                            formKeyPassword.currentState!.validate()) {
                          formKeyFullName.currentState!.save();
                          formKeyEmail.currentState!.save();
                          formKeyPassword.currentState!.save();

                          String fullName = fullNameController.text;
                          String email = emailController.text;
                          String password = passwordController.text;

                          String? registrationError =
                              await _autenServico.cadastrarUsuario(
                            fullName: fullName,
                            email: email,
                            password: password,
                          );

                          if (registrationError != null) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(registrationError),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(
                              context,
                              "/welcome_page",
                              arguments: fullNameController.text,
                            );
                          }
                        }
                      },
                      color: Color(0xFF0047AB),
                      borderRadius: BorderRadius.circular(40),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                        child: Text(
                          'Registre-se',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // login
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Já possui uma conta? ',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontFamily: 'Roboto-Regular',
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                color: Color(0xFF1F4AC2),
                                fontSize: 18,
                                fontFamily: 'Roboto-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
