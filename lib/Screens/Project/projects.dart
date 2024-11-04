import 'package:flutter/material.dart';
import 'coursedata.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final List<CourseCardData> coursesList = [
    CourseCardData(
      imagePath: 'images/Rectangle_19.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),
    CourseCardData(
      imagePath: 'images/Rectangle_18.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ), CourseCardData(
      imagePath: 'images/Rectangle_18.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ), CourseCardData(
      imagePath: 'images/Rectangle_18.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ), CourseCardData(
      imagePath: 'images/Rectangle_18.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),
    CourseCardData(
      imagePath: 'images/Rectangle_17.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),    CourseCardData(
      imagePath: 'images/Rectangle_17.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),    CourseCardData(
      imagePath: 'images/Rectangle_17.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),    CourseCardData(
      imagePath: 'images/Rectangle_17.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),
    CourseCardData(
      imagePath: 'images/Rectangle_16.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),   CourseCardData(
      imagePath: 'images/Rectangle_16.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),   CourseCardData(
      imagePath: 'images/Rectangle_16.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),   CourseCardData(
      imagePath: 'images/Rectangle_16.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),
    CourseCardData(
      imagePath: 'images/Rectangle_19.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ), CourseCardData(
      imagePath: 'images/Rectangle_19.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ), CourseCardData(
      imagePath: 'images/Rectangle_19.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ), CourseCardData(
      imagePath: 'images/Rectangle_19.png',
      title: 'Kemampuan Merangkum\nTulisan',
      subject: 'BAHASA SUNDA',
      instructor: 'Al-Baiqi Samaan',
      grade: 'A',
    ),
  ];

  String searchQuery = '';


  @override
  Widget build(BuildContext context) {
    List<CourseCardData> filteredCourses = coursesList
        .where((course) => course.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                searchBar(),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CourseCard(
                          searchQuery: searchQuery,
                          data: filteredCourses[index],
                          onTap: () {
                            print('Tapped on course: ${filteredCourses[index].title}');
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.6)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: null,
                    borderRadius: BorderRadius.circular(18),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.filter_list,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Filter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search a project',
          hintStyle: TextStyle(color: Colors.grey[600]),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey[500]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey[500]!),
          ),
          suffixIcon: Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Icon(Icons.search, color: Colors.white, size: 18),
          ),
        ),
      ),
    );
  }
}
