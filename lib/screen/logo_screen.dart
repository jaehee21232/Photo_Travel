import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_travel/common/data.dart';
import 'package:photo_travel/main.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool lightTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;

    void contextGo(String router, bool go) {
      if (go) {
        context.go(router);
      } else {
        context.push(router);
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/imgs/logo/Logo_${lightTheme ? 'black' : 'white'}.png',
              scale: size.width * (0.02),
            ),
            Column(
              children: [
                const Text('자신의 인생을 기록해보세요'),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    final login = await storage.read(key: 'autoLogin');
                    if (login == null) {
                      contextGo('/register', false);
                    } else {
                      contextGo('/tab-main', true);
                    }
                  },
                  child: Ink(
                    width: size.width * (0.55),
                    height: size.width * (0.12),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "시작하기",
                        style: TextStyle(
                            color: lightTheme ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * (0.050)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
