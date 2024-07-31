import 'package:alsagr_app/core/extensions/build_context.dart';
import 'package:alsagr_app/models/player_model.dart';
import 'package:alsagr_app/services/firebase.dart';
import 'package:flutter/material.dart';

import '../components/network_image.dart';

class PlayersCard extends StatefulWidget {
  const PlayersCard({super.key});

  @override
  State<PlayersCard> createState() => _PlayersCardState();
}

class _PlayersCardState extends State<PlayersCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PlayerModel>>(
      future: FirebaseApiService().getAllPlayers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PlayerModel>? players = snapshot.data;
          return Container(
            height: context.height / 4,
            width: context.width,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: players?.length ?? 0,
              padding: const EdgeInsets.all(8),
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 164, 127, 162),
                      width: 2.0,
                      style: BorderStyle.none, // نمط الحافة المتقطعة
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 236, 233, 233),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: AppCashedImage(
                          imageUrl: players?[index].playerImage ?? "",
                          width: context.width * .35,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(players?[index].playerPosition ?? ""),
                      Text(
                        (players?[index].playerNumber.toString() ?? "")
                            .replaceAll("null", ""),
                      ),
                      Text(
                        players?[index].playerName ?? "",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
