import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_testing/sample_bloc/sample_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

main() {
  // when();
  group(
    'Test bloc events & states sequence',
    () {
      blocTest<SampleBloc, SampleState>(
        'Make sure the bloc emits the correct states when events are added',
        build: () => SampleBloc(),
        seed: () => const SampleState(isEnabled: false, selectedIndex: 0),
        tearDown: () {},
        act: (sampleBloc) {
          sampleBloc.add(ToggleSwitched());
          sampleBloc.add(ToggleSwitched());
          sampleBloc.add(const SelectedIndexChanged(1));
          sampleBloc.add(const SelectedIndexChanged(2));
          sampleBloc.add(const SelectedIndexChanged(3));
          sampleBloc.add(ToggleSwitched());
        },
        expect: () => <SampleState>[
          const SampleState(isEnabled: true, selectedIndex: 0),
          const SampleState(isEnabled: false, selectedIndex: 0),
          const SampleState(isEnabled: false, selectedIndex: 1),
          const SampleState(isEnabled: false, selectedIndex: 2),
          const SampleState(isEnabled: false, selectedIndex: 3),
          const SampleState(isEnabled: true, selectedIndex: 3),
        ],
      );
    },
  );
}
