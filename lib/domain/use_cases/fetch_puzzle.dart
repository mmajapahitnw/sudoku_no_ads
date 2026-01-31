import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sudoku_no_ads/domain/entities/puzzle.dart';

class FetchPuzzle {
  Map<String, String> call() {
    return {
      'difficulty': 'easy',
      'puzzle': '068451793574923681931786452345692817192578364786314925657239148829147536413865279',
      'solution': '268451793574923681931786452345692817192578364786314925657239148829147536413865279',
    };
  }

  Future<void> fetchData() async {
    const apiKey = 'DH2XeXPv9rPS8C6BoRdw1Azh4dB0B9cSXI_DiYQP9_I';
    final url = Uri.parse('https://you-do-sudoku-api.vercel.app/api');

    final response = await http.post(
        url,
        headers:  {
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
        },
        body: jsonEncode({
          'difficulty': 'easy',
          'solution': true,
          'array': false,
        })
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final puzzle = Puzzle.fromJson(jsonDecode(response.body) as Map<String, String>);
      print(puzzle);
    } else {
      throw Exception('Failed to fetch puzzle: ${response.statusCode}');
    }
  }
}

