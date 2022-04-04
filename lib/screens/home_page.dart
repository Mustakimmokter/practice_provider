import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_bottom_sheet.dart';
import '../statemanages/statemanages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.green[400],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.menu,
                      size: 35,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Consumer<Statemanagement>(
                      builder: (context, stateManage, child) {
                    return Text(
                      '${stateManage.tasks.length} Tasks',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Consumer<Statemanagement>(
                  builder: (context, stateManage, child) {
                    return ListView(
                      children: [
                        for (int a = 0; a < stateManage.tasks.length; a++)
                          ListTile(
                            title: Text(
                              '${a + 1}. ${stateManage.tasks[a].name}',
                              style: const TextStyle(fontSize: 20),
                            ),
                            trailing: Checkbox(
                              value: stateManage.tasks[a].isDone,
                              onChanged: (value) {
                                stateManage.getCheckValue(value!, a);
                              },
                            ),
                            onLongPress: () {
                              Provider.of<Statemanagement>(context,
                                      listen: false)
                                  .deleteTask(a);
                            },
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[400],
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return CustomBottomSheet(
                controller: controller,
                onTap: () {
                  Provider.of<Statemanagement>(context, listen: false)
                      .addTask(controller.text);
                  Navigator.pop(context);
                  controller.clear();
                },
              );
            },
          );
        },
      ),
    );
  }
}
