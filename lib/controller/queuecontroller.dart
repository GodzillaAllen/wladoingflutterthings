import 'package:get/get.dart';

class QueueController extends GetxController {
  var stack1 = <String>[].obs;
  var stack2 = <String>[].obs;
  var output = ''.obs;

  void enqueue(String value) {
    stack1.add(value);
    output.value = 'Enqueued: $value';
  }

  void dequeue() {
    if (stack2.isEmpty) {
      while (stack1.isNotEmpty) {
        stack2.add(stack1.removeLast());
      }
    }
    if (stack2.isEmpty) {
      output.value = 'Queue is empty';
    } else {
      output.value = 'Dequeued: ${stack2.removeLast()}';
    }
  }
}
