import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {

    print("object");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer(builder: (context, ref, child) {
          var count = ref.watch(counterCaseStateNotifier);
          return Text(count.toString());
        }),
        SizedBox(
          height: 50,
        ),
        AppButton(
            text: "count",
            onPress: () {
              int count = ref.read(counterCaseStateNotifier);
              ref
                  .read(counterCaseStateNotifier.notifier)
                  .updateState(++count);
            })
      ],
    );
  }
}
