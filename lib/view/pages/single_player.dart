import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/single_player_controller.dart';

class SinglePlayer extends StatelessWidget {
  const SinglePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SinglePlayerController>(
      init: SinglePlayerController()..resetGame(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Single Player'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Text(
                  controller.isGameOver.value
                      ? (controller.winner.value == 'draw'
                          ? "it's a draw"
                          : controller.winner.value == controller.human
                              ? 'you win!'
                              : 'computer wins')
                      : controller.currentPlayer.value == controller.human
                          ? 'your turn'
                          : 'computer thinking...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        final value = controller.board[index];
                        Widget? icon;
                        if (value == controller.human) {
                          icon = Image.asset('assets/icons/X_icon.png');
                        } else if (value == controller.computer) {
                          icon = Image.asset('assets/icons/O_icon.png');
                        }

                        return InkWell(
                          onTap: () => controller.onCellTap(index),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.05),
                            ),
                            alignment: Alignment.center,
                            child: icon,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.resetGame,
                    child: const Text('new game'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}