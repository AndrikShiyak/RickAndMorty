import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/character.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/widgets/character_status_widget.dart';

import '../../config/routes/app_routes.dart';
import 'cached_network_image_widget.dart';

class CharacterCard extends HookWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _onTap(context, character.id),
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImageWidget(
                imageUrl: character.image,
                width: 100,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(character.species),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CharacterStatusWidget(status: character.status),
                          const SizedBox(width: 10),
                          Text(character.status),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int characterId) => Navigator.of(context)
      .pushNamed(AppRoutes.characterDetails, arguments: characterId);
}
