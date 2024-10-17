part of 'sample_bloc.dart';

 class SampleState extends Equatable {
   const SampleState({required this.isEnabled, required this.selectedIndex});

   final bool isEnabled;
   final int selectedIndex;

  @override
  // TODO: implement props
  List<Object?> get props => [isEnabled, selectedIndex];


  factory SampleState.initial() {
    return const SampleState(isEnabled: false, selectedIndex: 0);
  }

   SampleState copyWith({
    bool? isEnabled,
    int? selectedIndex,
  }) {
    return SampleState(
      isEnabled: isEnabled ?? this.isEnabled,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
