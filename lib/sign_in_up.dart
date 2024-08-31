import 'package:exploregalapagos/main_screen.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/models/usuario.dart';

class SignInUp extends StatefulWidget {
  const SignInUp({super.key});

  @override
  _SignInUpState createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {
  bool isLogin = true;

  final TextEditingController _nickname = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Usuario? usuario;

  int number = 0;

  List<Usuario>? listaUsuarios;

  @override
  void dispose() {
    _nickname.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> postUsuario() async {
      try{
        if(_nickname.text == '' || _password.text == ''){
          throw Exception();
        }
        var response = await Dio().post('$urlBack/usuario/crear_usuario//',
          data: {
            'nickname': _nickname.text,
            'password': _password.text,
          }
        ); 
        if (response.statusCode == 201) {
          setState(() {number = 1;});
        }
      }
      catch (e) {
        if (e is DioException) {
          print('Error peticion');
        }
      }
    }

  Future<void> getUsuario() async {
    try{
      if(_nickname.text == '' || _password.text == ''){
          throw Exception();
      }
      var response = await Dio().get('$urlBack/usuario/nickname/${_nickname.text}/'); 
      if (response.statusCode == 200) {
        print("encontrado");
        List<dynamic> data = response.data;
        listaUsuarios = data.map((json) => Usuario.fromJson(json)).toList();
        usuario = listaUsuarios![0];
        Credenciales.nicknameUsuario = usuario!.nickname;
        Credenciales.idUsuario = usuario!.id;
        setState(() {
        }); 
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Error peticion');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/R.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  exploreGreen,
                  exploreGreen1,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "lib/assets/logo_gala.png",
                  width: size.width * 0.35,
                ),
                Text(
                  'EXPLOREGALÁPAGOS.',
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLogin = true;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color:
                                      isLogin ? colorbuttonGreen : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'INICIAR SESIÓN',
                                    style: TextStyle(
                                      color:
                                          isLogin ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLogin = false;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color:
                                      isLogin ? Colors.white : colorbuttonGreen,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'REGISTRO',
                                    style: TextStyle(
                                      color:
                                          isLogin ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _nickname,
                        decoration: InputDecoration(
                          hintText: 'Usuario',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorbuttonGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          if(isLogin){
                            //setState(() {
                              await getUsuario();
                            //}); 
                            //print(usuario!.nickname);
                            if(usuario != null){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            }
                          }
                          else{
                            await postUsuario();
                            if(number == 1){
                              setState(() {isLogin = true;}); 
                            }
                          }},
                          /*onPressed: () {setState(() {
                            if (isLogin) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            } else {
                              isLogin = true;
                            }
                          });
                        },*/
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            isLogin ? 'INICIAR SESIÓN' : 'REGISTRATE',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin
                              ? '¿No tienes una cuenta?'
                              : '¿Ya tienes una cuenta?',
                          style: const TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
