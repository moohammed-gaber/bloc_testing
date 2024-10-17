import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc() : super(SampleState.initial()) {
    on<SelectedIndexChanged>(_onSelectedIndexChanged);
    on<ToggleSwitched>(_onToggleSwitched);
  }

  FutureOr<void> _onSelectedIndexChanged(SelectedIndexChanged event, Emitter<SampleState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }

  FutureOr<void> _onToggleSwitched(ToggleSwitched event, Emitter<SampleState> emit) {
    emit(state.copyWith(isEnabled: !state.isEnabled));
  }
}
