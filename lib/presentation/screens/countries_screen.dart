import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/data/repository.dart';
import 'package:sports/presentation/cubit/country_cubit.dart';
import 'package:sports/presentation/cubit/country_state.dart';

import '../cubit/leagues_cubit.dart';
import '../screens/leagues_screen.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Country'),
      ),
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountriesLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return ListTile(
                  title: Text(country.name),
                  leading: CachedNetworkImage(
                    imageUrl: country.image ??
                        "https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg",
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      "https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg",
                      height: 50,
                      width: 50,
                    ),
                    height: 50,
                    width: 50,
                  ),
                  onTap: () {
                    if (country.id != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) =>
                                LeaguesCubit(context.read<Repository>()),
                            child: LeaguesScreen(
                              countryId: country.id!,
                            ),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Country ID is null'),
                        ),
                      );
                    }
                  },
                );
              },
            );
          } else if (state is CountriesError) {
            return Center(
                child: Text('Failed to load countries: ${state.message}'));
          } else {
            return const Center(child: Text('Press button to load countries'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CountriesCubit>().fetchCountries();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
