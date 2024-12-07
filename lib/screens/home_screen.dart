import 'package:flutter/material.dart';
import 'video_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> grades = ['Grade 1', 'Grade 2', 'Grade 3', 'Grade 4', 'Grade 5', 'Grade 6'];

  final List<Map<String, String>> subjects = [
    {'name': 'Math', 'image': 'assets/math.png'},
    {'name': 'Science', 'image': 'assets/science.png'},
    {'name': 'English', 'image': 'assets/English.png'},
    {'name': 'History', 'image': 'assets/history.png'},
    {'name': 'Art', 'image': 'assets/Art.png'},
    {'name': 'Music', 'image': 'assets/music.png'},
  ];

  String selectedGrade = 'Grade 1';
  String selectedSubject = 'Math';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/PrimaryLearnersAppBanner.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome to Primary Learners App!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Grade Dropdown
            DropdownButton<String>(
              value: selectedGrade,
              items: grades.map((grade) {
                return DropdownMenuItem(value: grade, child: Text(grade));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGrade = value!;
                });
              },
              dropdownColor: Colors.green.shade100,
              style: const TextStyle(color: Colors.green, fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Subject Selection through Images
            const Text(
              'Select a Subject:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  final isSelected = selectedSubject == subject['name'];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubject = subject['name']!;
                      });
                    },
                    child: Card(
                      color: isSelected ? Colors.blue.shade100 : Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            subject['image']!,
                            width: 100,
                            height: 100 ,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            subject['name']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Find Lessons Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoListScreen(
                        grade: selectedGrade,
                        subject: selectedSubject,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: const Text('Find Lessons'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
