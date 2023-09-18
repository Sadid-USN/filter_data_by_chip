import 'package:flutter/material.dart';

import 'dart:async';

class AnimatedTextScreen extends StatefulWidget {
  const AnimatedTextScreen({super.key});

  @override
  _AnimatedTextScreenState createState() => _AnimatedTextScreenState();
}

class _AnimatedTextScreenState extends State<AnimatedTextScreen> {
  String message =
      "Пожалуйста, скачайте приложение \"Azkar\". В нем поддерживается несколько языков, включая таджикский. С начала этого момента приложение \"Avrod\" больше не будет обновляться и в скором времени будет удалено из Google Play.";

  Timer? timer;
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Важное сообщение"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // При закрытии AlertDialog запускаем таймер снова
                  timer.cancel();
                },
                child: const Text("Закрыть"),
              ),
            ],
          );
        },
      );
      // Остановка таймера после показа AlertDialog
      timer.cancel();
    });
  }

  @override
  void dispose() {
    // Отменяем таймер при закрытии экрана
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Text Screen"),
      ),
      body: const Center(
        child: Text("Домашняя страница"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showMessage = true;
          });

          startTimer();
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
