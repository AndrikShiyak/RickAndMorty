import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/app_routes.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/widgets/card_widget/card_widget.dart';
import '../../../domain/entities/character.dart';
import '../cached_network_image_widget.dart';
import '../character_status_widget.dart';
import 'card_center.dart';

class CharacterCard extends HookWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      onTap: () => Navigator.of(context)
          .pushNamed(AppRoutes.characterDetails, arguments: character.id),
      indentation: 10,
      left: CachedNetworkImageWidget(
        imageUrl: character.image,
        width: 100,
      ),
      center: CardCenter(
        top: character.name,
        center: character.species,
        bottom: Row(
          children: [
            CharacterStatusWidget(status: character.status),
            const SizedBox(width: 10),
            Text(character.status),
          ],
        ),
      ),
    );
  }
}
