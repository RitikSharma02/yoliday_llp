import 'package:flutter/material.dart';
class CourseCardData {
  final String imagePath;
  final String title;
  final String subject;
  final String instructor;
  final String grade;


  CourseCardData( {
    required this.imagePath,
    required this.title,
    required this.subject,
    required this.instructor,
    required this.grade,
  });
}

Widget CourseCard({
  required CourseCardData data,
  double? height,
  VoidCallback? onTap,
String searchQuery = '',
}) {
  bool isMatched = searchQuery.isNotEmpty &&
      data.title.toLowerCase().contains(searchQuery.toLowerCase());
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(left: 2.0, right: 2,bottom: 2),
      constraints: BoxConstraints(
        minHeight: height ?? 120,
      ),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isMatched ? Color(0xffDF5532) : Colors.grey[300]!,
          width: isMatched ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.asset(
                  data.imagePath,
                  width: constraints.maxWidth * 0.3,
                  height: height ?? 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: constraints.maxWidth * 0.3,
                      height: height ?? 120,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[600],
                      ),
                    );
                  },
                ),
              ),
              // Middle Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.subject,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[800],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Oleh ${data.instructor}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                  colors: [Color(0xffF39519), Color(0xffFFCD67)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  data.grade,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}