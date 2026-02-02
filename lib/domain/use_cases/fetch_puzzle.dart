import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sudoku_no_ads/domain/entities/puzzle.dart';

class FetchPuzzle {
  Map<String, String> call() {
    return {
      'difficulty': 'easy',
      'puzzle': '068401790574923681931786452345692817192578364786314925657239148829147536413865279',
      'solution': '268451793574923681931786452345692817192578364786314925657239148829147536413865279',
    };
  }

  Future<Puzzle> fetchData(String difficulty) async {
    const apiKey = 'gM0uK8WknNLRZNLzMOr8Rr02j8ylEKuRxMKCxUzJWbE';
    final url = Uri.parse('https://you-do-sudoku-api.vercel.app/api');

    final response = await http.post(
        url,
        headers:  {
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
        },
        body: jsonEncode({
          'difficulty': difficulty
        })
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Puzzle puzzle = Puzzle.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      return puzzle;
    } else {
      throw Exception('Failed to fetch puzzle: ${response.statusCode}');
    }
  }
}

