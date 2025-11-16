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
        final theme = Theme.of(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('single player'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'tic tac toe',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onBackground.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            controller.isGameOver.value
                                ? Icons.emoji_events_outlined
                                : Icons.videogame_asset_outlined,
                            size: 22,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              controller.isGameOver.value
                                  ? (controller.winner.value == 'draw'
                                      ? "it's a draw"
                                      : controller.winner.value ==
                                              controller.human
                                          ? 'you win this round!'
                                          : 'computer wins this round')
                                  : controller.currentPlayer.value ==
                                          controller.human
                                      ? 'your move — tap an empty square'
                                      : 'computer is thinking...',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                              borderRadius: BorderRadius.circular(14),
                              color: theme.colorScheme.surface,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                color: theme.colorScheme.primary
                                    .withOpacity(0.07),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: icon,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: controller.resetGame,
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('start a new game'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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