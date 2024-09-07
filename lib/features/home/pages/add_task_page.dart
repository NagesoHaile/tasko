import 'package:flutter/material.dart';
import 'package:tasko/core/widgets/app_text_field.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({super.key});
  static const String routeName = 'add-task-page-route-name';

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final formKey = GlobalKey<FormState>();

  Widget sizedBox = const SizedBox(
    height: 12,
  );

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  DateTime? _dueDate;

  // Function to show DatePicker
  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _dueDate) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const AppTextField(
                  label: 'Title',
                  obscureText: false,
                ),
                sizedBox,
                const AppTextField(
                  label: 'Description',
                  obscureText: false,
                ),
                sizedBox,
                sizedBox,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _dueDate == null
                            ? 'No Date Chosen!'
                            : '${_dueDate!.toLocal()}'.split(' ')[0],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _selectDueDate(context);
                      },
                      child: const Text('Select Due Date'),
                    )
                  ],
                ),
                sizedBox,
                sizedBox,
                sizedBox,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
