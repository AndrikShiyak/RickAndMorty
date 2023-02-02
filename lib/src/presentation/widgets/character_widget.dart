import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/character.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.yellow,
      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Text(character.name),
    );
  }
}
