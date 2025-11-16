import 'dart:math';

import 'package:get/get.dart';

class SinglePlayerController extends GetxController {
  /// board positions: 0-8
  /// values: '', 'X', 'O'
  final RxList<String> board = List<String>.filled(9, '').obs;

  /// player is always 'X', computer is 'O'
  final String human = 'X';
  final String computer = 'O';

  final RxString currentPlayer = 'X'.obs;
  final RxString winner = ''.obs;
  final RxBool isGameOver = false.obs;

  final _random = Random();

  void resetGame() {
    for (var i = 0; i < board.length; i++) {
      board[i] = '';
    }
    currentPlayer.value = human;
    winner.value = '';
    isGameOver.value = false;
    update();
  }

  void onCellTap(int index) {
    if (isGameOver.value || board[index].isNotEmpty || currentPlayer.value != human) {
      return;
    }

    board[index] = human;
    _finalizeMove();

    if (!isGameOver.value) {
      Future.delayed(const Duration(milliseconds: 600), () {
        // ensure game is still active and it's computer's turn
        if (!isGameOver.value && currentPlayer.value == computer && _hasEmptyCells()) {
          _computerMove();
        }
      });
    }
  }

  void _computerMove() {
    // small delay could be added via Future.delayed in the ui if desired
    final move = _findBestMove();
    if (move == -1) return;

    board[move] = computer;
    _finalizeMove();
  }

  void _finalizeMove() {
    final win = _checkWinner();
    if (win != null) {
      winner.value = win;
      isGameOver.value = true;
    } else if (!_hasEmptyCells()) {
      winner.value = 'draw';
      isGameOver.value = true;
    } else {
      currentPlayer.value = currentPlayer.value == human ? computer : human;
    }
    update();
  }

  bool _hasEmptyCells() => board.any((cell) => cell.isEmpty);

  String? _checkWinner() {
    const lines = <List<int>>[
      // rows
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      // columns
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      // diagonals
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (final line in lines) {
      final a = board[line[0]];
      final b = board[line[1]];
      final c = board[line[2]];
      if (a.isNotEmpty && a == b && b == c) {
        return a;
      }
    }
    return null;
  }

  int _findBestMove() {
    // 1. if computer can win in one move, do it
    final winningMove = _findWinningMove(computer);
    if (winningMove != -1) return winningMove;

    // 2. if human can win next, block
    final blockingMove = _findWinningMove(human);
    if (blockingMove != -1) return blockingMove;

    // 3. take center if available
    if (board[4].isEmpty) return 4;

    // 4. take any corner
    const corners = [0, 2, 6, 8];
    final availableCorners = corners.where((i) => board[i].isEmpty).toList();
    if (availableCorners.isNotEmpty) {
      return availableCorners[_random.nextInt(availableCorners.length)];
    }

    // 5. take any remaining side
    final emptyIndices = <int>[];
    for (var i = 0; i < board.length; i++) {
      if (board[i].isEmpty) emptyIndices.add(i);
    }

    if (emptyIndices.isEmpty) return -1;
    return emptyIndices[_random.nextInt(emptyIndices.length)];
  }

  int _findWinningMove(String player) {
    const lines = <List<int>>[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (final line in lines) {
      final a = line[0];
      final b = line[1];
      final c = line[2];

      final values = [board[a], board[b], board[c]];
      final playerCount = values.where((v) => v == player).length;
      final emptyIndices =
          [a, b, c].where((i) => board[i].isEmpty).toList(growable: false);

      if (playerCount == 2 && emptyIndices.length == 1) {
        return emptyIndices.first;
      }
    }

    return -1;
  }
}
