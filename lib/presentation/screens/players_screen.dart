import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/players_cubit.dart';

class PlayersScreen extends StatelessWidget {
  final int teamId;

  PlayersScreen({required this.teamId});

  @override
  Widget build(BuildContext context) {
    context.read<PlayersCubit>().fetchPlayers(teamId);

    return Scaffold(
      appBar: AppBar(title: Text('Players')),
      body: BlocBuilder<PlayersCubit, PlayersState>(
        builder: (context, state) {
          if (state is PlayersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PlayersLoaded) {
            return ListView.builder(
              itemCount: state.players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.players[index].name),
                );
              },
            );
          } else {
            return Center(child: Text('Failed to load players'));
          }
        },
      ),
    );
  }
}
