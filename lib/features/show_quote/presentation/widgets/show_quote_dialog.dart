import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasko/features/show_quote/data/models/quote.dart';

class DialogWidget {
  static void showQuoteDialog(
    BuildContext context, {
    required Quote quote,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("'${quote.quote}'"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
                Text("-${quote.author}"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Continue'),
                )
              ],
            ),
          );
        });
  }
}
