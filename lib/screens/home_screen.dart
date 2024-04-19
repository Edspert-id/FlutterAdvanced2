import 'package:edspert_advance_2/screens/subject_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subject {
  final String name;
  final int exerciseDone;
  final int exerciseTotal;

  const Subject({
    required this.exerciseDone,
    required this.exerciseTotal,
    required this.name,
  });
}

List<Subject> dataPelajaran = [
  Subject(exerciseDone: 1, exerciseTotal: 50, name: 'Matematika'),
  Subject(exerciseDone: 2, exerciseTotal: 50, name: 'IPA'),
  Subject(exerciseDone: 3, exerciseTotal: 50, name: 'Bahasa'),
];

List<Subject> dataPelajaran2 = [
  Subject(exerciseDone: 0, exerciseTotal: 50, name: 'Matematika 2'),
  Subject(exerciseDone: 0, exerciseTotal: 50, name: 'IPA 2'),
  Subject(exerciseDone: 0, exerciseTotal: 50, name: 'Bahasa 2'),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai, Altop',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(radius: 16),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            child: Center(
              child: ListView.separated(
                itemCount: dataPelajaran.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SubjectDetail(subject: dataPelajaran[index]),
                        )),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataPelajaran[index].name),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                dataPelajaran.clear();
                dataPelajaran.addAll(dataPelajaran2);
              });
            },
            child: Text("next page"),
          )
        ],
      ),
    );
  }
}
