import 'package:flutter/material.dart';
import 'package:flutterdarmstadt2/call_screen/blurred_bottom_bar.dart';
import 'package:flutterdarmstadt2/call_screen/blurred_icon_button.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/call_person.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 24,
            left: 16,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                  size: 16,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: BlurredBottomBar.HEIGHT + 56 + 56 + 24,
            right: 16,
            child: BlurredIconButton(
              onTap: () {},
              icon: Icon(
                Icons.camera,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: BlurredBottomBar.HEIGHT + 56,
            right: 16,
            child: BlurredIconButton(
              onTap: () {},
              icon: Icon(
                Icons.mic_off,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: BlurredBottomBar.HEIGHT + BlurredBottomBar.BUTTON_SIZE / 2 + 24,
            left: 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Travis Hunt',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      fontSize: 32),
                ),
                Text(
                  'Agent',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlurredBottomBar(),
    );
  }
}
