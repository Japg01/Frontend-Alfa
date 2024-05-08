import 'package:alfa_soyzen/presentation/onboarding/onboarding_screen_2.dart';
import 'package:alfa_soyzen/presentation/onboarding/onboarding_screen_3.dart';
import 'package:alfa_soyzen/presentation/auth/verification_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const OnBoardingScreen1());

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const SizedBox(height: 50),
        yogaImage(),
        const SizedBox(height: 20),
        yogaDaily(),
        const SizedBox(height: 90),
        const BarraNavegacion(),
      ],
    )));
  }
}

Widget yogaImage() {
  return SizedBox(
    height: 304.0,
    width: 328.0,
    child: Image.asset('assets/images/yoga1.png'),
  );
}

Widget yogaDaily() {
  return const Column(
    children: [
      SizedBox(
        width: 55,
        height: 28,
        child: Text('Yoga',
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
          width: 190,
          height: 49,
          child: Text(
            'Daily Yoga',
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
          'Do your practice of physical exercise and \n relaxation make helthy',
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

class Buttom extends StatelessWidget {
  const Buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(130, 54), // button width and height
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => const OnBoardingScreen2(),
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
                      builder: (_) => const VerificationScreen(),
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
                    icon: const Icon(Icons.radio_button_checked),
                    onPressed: () {},
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
                    icon: const Icon(Icons.radio_button_unchecked),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const OnBoardingScreen3(),
                      ));
                    },
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
