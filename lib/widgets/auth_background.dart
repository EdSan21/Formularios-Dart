import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _PurpleBox(),
        _HeaderIcon(),
        this.child,
      ]),
    );
  }
}

class AuthBackgroundProd extends StatelessWidget {
  const AuthBackgroundProd({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _ColorBox(),
        _HeaderIconProd(),
        this.child,
      ]),
    );
  }
}

class AuthBackgroundHome extends StatelessWidget {
  const AuthBackgroundHome({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _ColorMenuBox(),
        this.child,
      ]),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, left: -20),
          Positioned(child: _Bubble(), top: -50, left: 10),
          Positioned(child: _Bubble(), top: -120, left: 20),
          Positioned(child: _Bubble(), top: 70, left: 20),
          Positioned(child: _Bubble(), top: -10, left: 120),
          Positioned(child: _Bubble(), top: 80, left: 5),
        ],
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _colorBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, left: -20),
          Positioned(child: _Bubble(), top: -50, left: 10),
          Positioned(child: _Bubble(), top: -120, left: 20),
          Positioned(child: _Bubble(), top: 70, left: 20),
          Positioned(child: _Bubble(), top: -10, left: 120),
          Positioned(child: _Bubble(), top: 80, left: 5),
        ],
      ),
    );
  }
}

class _ColorMenuBox extends StatelessWidget {
  const _ColorMenuBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _colorHome(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, left: -20),
          Positioned(child: _Bubble(), top: -50, left: 10),
          Positioned(child: _Bubble(), top: -120, left: 20),
          Positioned(child: _Bubble(), top: 70, left: 20),
          Positioned(child: _Bubble(), top: -10, left: 120),
          Positioned(child: _Bubble(), top: 80, right: 50),
          Positioned(child: _Bubble(), top: -70, right: 60),
          Positioned(child: _Bubble(), top: -60, right: 70),
          Positioned(child: _Bubble(), top: -50, right: 80),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.25),
        ));
  }
}

BoxDecoration _purpleBackground() => BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromRGBO(63, 63, 150, 1),
      Color.fromRGBO(90, 70, 178, 1),
    ]));

BoxDecoration _colorBackground() => BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(255, 38, 203, 156),
      Color.fromARGB(255, 213, 64, 184),
    ]));

BoxDecoration _colorHome() => BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(255, 240, 227, 227),
      Color.fromARGB(255, 110, 233, 3),
    ]));

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _HeaderIconProd extends StatelessWidget {
  const _HeaderIconProd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.shopify_outlined, color: Colors.white, size: 100),
      ),
    );
  }
}
