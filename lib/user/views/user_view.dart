import 'package:flutter/material.dart';
import 'package:lumea/user/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 145, 29, 89),
            child: Stack(
              children: [
                Positioned(
                    top: MediaQuery.of(context).size.height / 6,
                    left: MediaQuery.of(context).size.width / 3.5,
                    child: const Center(
                      child: Text(
                        "Lumea",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(53),
                          topRight: Radius.circular(53),
                        ),
                      ),
                      child: Column(
                        children: [
                          const TabBar(
                            indicatorColor: Color.fromARGB(255, 145, 29, 89),
                            labelColor: Color.fromARGB(255, 145, 29, 89),
                            tabs: [
                              Tab(text: 'Login'),
                              Tab(text: 'Register'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              Form(
                                key: _formKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 40),
                                      TextFormField(
                                        controller: _emailController,
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter the email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 40),
                                      TextFormField(
                                        controller: _passwordController,
                                        decoration: const InputDecoration(
                                          labelText: 'Password',
                                          border: OutlineInputBorder(),
                                        ),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter the password';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 40),
                                      InkWell(
                                        onTap: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            final email = _emailController.text;
                                            final password =
                                                _passwordController.text;
                                            Provider.of<UserViewModel>(context,
                                                    listen: false)
                                                .login(email, password);
                                            Navigator.pushReplacementNamed(
                                                context, '/recommendation');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text('user logged in'),
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 145, 29, 89),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                              child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 40),
                                    TextFormField(
                                      controller: _usernameController,
                                      decoration: const InputDecoration(
                                        labelText: 'UserName',
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter the username';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 40),
                                    TextFormField(
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter the email';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 40),
                                    TextFormField(
                                      controller: _passwordController,
                                      decoration: const InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(),
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter the password';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 40),
                                    InkWell(
                                      onTap: () {
                                        if (_formKey2.currentState
                                                ?.validate() ??
                                            false) {
                                          final email = _emailController.text;
                                          final password =
                                              _passwordController.text;
                                          Provider.of<UserViewModel>(context,
                                                  listen: false)
                                              .login(email, password);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text('user logged in'),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 145, 29, 89),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
