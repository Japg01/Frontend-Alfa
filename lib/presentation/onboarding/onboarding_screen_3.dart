import 'package:alfa_soyzen/presentation/login/home.dart';
import 'package:alfa_soyzen/presentation/onboarding/onboarding_screen_1.dart';
import 'package:alfa_soyzen/presentation/onboarding/onboarding_screen_2.dart';
import 'package:alfa_soyzen/presentation/auth/verification_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const OnBoardingScreen3());

class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
      children: [
        SizedBox(height: 100),
        YogaImage(),
        SizedBox(height: 65),
        YogaDaily(),
        SizedBox(height: 90),
        BarraNavegacion(),
      ],
    )));
  }
}

class YogaImage extends StatelessWidget {
  const YogaImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208.0,
      width: 290.0,
      child: Image.asset('assets/images/yoga3.png'),
    );
  }
}

class YogaDaily extends StatelessWidget {
  const YogaDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: 63,
          height: 28,
          child: Text('Meets',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4F14A0),
                fontWeight: FontWeight.w400,
                fontSize: 22,
                fontFamily: 'PTSans',
              )),
        ),
        SizedBox(height: 10),
        SizedBox(
            width: 200,
            height: 49,
            child: Text(
              'Community',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w700,
                  fontSize: 38,
                  fontFamily: 'PTSans'),
            )),
        SizedBox(height: 20),
        SizedBox(
          width: 290,
          height: 45,
          child: Text(
            'Do your practice of physical exercise and \nrelaxation make helthy',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF677294),
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: 'PTSans'),
          ),
        ),
        SizedBox(height: 35),
        Buttom(),
      ],
    );
  }
}

class Buttom extends StatelessWidget {
  const Buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(130, 54), // button width and height
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => const WelcomeScreen(),
          ));
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Next',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'PTSans'),
            ),
            Material(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xFF4F14A0), // button color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.chevron_right, color: Colors.white), // icon
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarraNavegacion extends StatelessWidget {
  const BarraNavegacion({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 100.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => const WelcomeScreen(),
                    ));
                  },
                  child: const Text('skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF677294),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: 'PTSans'))),
              const SizedBox(width: 123),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.radio_button_unchecked),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const OnBoardingScreen1(),
                      ));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.radio_button_unchecked),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const OnBoardingScreen2(),
                      ));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.radio_button_checked),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
