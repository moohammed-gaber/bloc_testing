part of 'sample_bloc.dart';

abstract class SampleEvent extends Equatable {
  const SampleEvent();
}

class SelectedIndexChanged extends SampleEvent {
  const SelectedIndexChanged(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

class ToggleSwitched extends SampleEvent {
  @override
  List<Object> get props => [];
}
