import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custom_text_field.dart';
import '../controller/queuecontroller.dart';

class QueueByStackHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final QueueController _queueController = Get.put(QueueController());

  QueueByStackHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queue by Stack'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _controller,
              label: 'Enter a value',
              type: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String value = _controller.text;
                    if (value.isNotEmpty) {
                      _queueController.enqueue(value);
                      _controller.clear();
                    }
                  },
                  child: const Text('Enqueue'),
                ),
                ElevatedButton(
                  onPressed: _queueController.dequeue,
                  child: const Text('Dequeue'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  _queueController.output.value,
                  style: const TextStyle(fontSize: 20),
                )),
            const SizedBox(height: 20),
            const Text('Queue:'),
            Obx(() {
              var queue = _queueController.stack2.reversed.toList() +
                  _queueController.stack1.toList();
              return Expanded(
                child: ListView.builder(
                  itemCount: queue.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(queue[index]),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
