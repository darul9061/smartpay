import 'package:flutter_bloc/flutter_bloc.dart';

part '_state.dart';
part '_events.dart';
part '_repo.dart';

class BLoc extends Bloc<Event, State> {
  Repository repo = Repository();

  BLoc() : super(State()) {
    on<Event>(testFunc);
  }

  testFunc(Event event, Emitter<State> emit) {
    emit(State());
  }
}
