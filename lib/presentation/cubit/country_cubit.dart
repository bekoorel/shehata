import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/data/repository.dart';
import 'package:sports/presentation/cubit/country_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final Repository repository;

  CountriesCubit(this.repository) : super(CountriesInitial());

  void fetchCountries() async {
    try {
      emit(CountriesLoading());
      final countries = await repository.fetchCountries();
      emit(CountriesLoaded(countries: countries));
    } catch (e) {
      emit(CountriesError(message: e.toString()));
    }
  }
}
