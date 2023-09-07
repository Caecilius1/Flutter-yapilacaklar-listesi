import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;
  //fonksiyonun parametre olarak geçmesi

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType taskType = TaskType.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/background.png"),
                      fit: BoxFit.cover),
                ),
                child: Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const Expanded(
                      child: Text(
                    "Yeni Görev Ekle",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
                ]),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("-Görev Başlığı-")),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Kategori",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori seçildi."),
                          ),
                        );
                        setState(() {
                          taskType = TaskType.note;
                        });
                      },
                      child: Image.asset("lib/assets/images/kategori_1.png",
                          width: 40, height: 40),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori seçildi."),
                          ),
                        );
                        setState(() {
                          taskType = TaskType.calendar;
                        });
                      },
                      child: Image.asset("lib/assets/images/kategori_2.png",
                          width: 40, height: 40),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori seçildi."),
                          ),
                        );
                        setState(() {
                          taskType = TaskType.contest;
                        });
                      },
                      child: Image.asset("lib/assets/images/kategori_3.png",
                          width: 40, height: 40),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text("-Tarih-"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: dateController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text("-Saat-"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: timeController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20), child: Text("-Acıklama-")),
              SizedBox(
                height: 300,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                      Task newTask = Task(
                          type: taskType,
                          title: titleController.text,
                          description: descriptionController.text,
                          isCompleted: false);
                          widget.addNewTask(newTask);
                          Navigator.pop(context);
                    },
                    child: const Text("Kaydet")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
