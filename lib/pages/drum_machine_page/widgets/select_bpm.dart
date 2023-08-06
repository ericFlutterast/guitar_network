import 'package:flutter/material.dart';
import 'package:guitar_network_vkr/notifier/dram_machine_provider.dart';
import 'package:provider/provider.dart';

class SelectBpm extends StatefulWidget {
  const SelectBpm({super.key});

  @override
  State<SelectBpm> createState() => _SelectBpmState();
}

class _SelectBpmState extends State<SelectBpm> {
  final controller = ScrollController(initialScrollOffset: 5500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(174, 255, 255, 255),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          controller: controller,
          itemCount: 400,
          itemBuilder: (context, index) {
            return TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                    const Color.fromARGB(28, 53, 53, 53)),
              ),
              onPressed: () {
                context.read<DrumMachineProvider>().switchBpm(index + 1);
              },
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }
}
