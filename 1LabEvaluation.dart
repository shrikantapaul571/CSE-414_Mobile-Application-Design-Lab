// Task 1: Build a Student Management System
// Create a Student class with name, id, and courses. Add methods to enroll/drop courses.
// Use encapsulation to protect GPA calculation logic.

import 'dart:io'; // Importing dart:io for user input handling

// Student class to store student details and manage courses
class Student {
  String name;
  String id;
  var courses = []; // List to store enrolled courses
  var gpaList = []; // List to store corresponding GPA for each course

  // Constructor to initialize student details
  Student(this.name, this.id);

  // Method to enroll in a course
  void enrollCourses(String course, double gpa) {
    if (!courses.contains(course)) {
      // Check if course is already enrolled
      courses.add(course);
      gpaList.add(gpa);
      print("$course is enrolled.\n");
    } else {
      print("$course is already enrolled.\n");
    }
  }

  // Method to drop a course
  void dropCourses(String course) {
    int index = courses.indexOf(course); // Get index of the course

    if (index != -1) {
      // If course exists in the list
      courses.removeAt(index);
      gpaList.removeAt(index);
      print("$course is dropped.\n");
    } else {
      print("$course is not enrolled.\n");
    }
  }

  // Private method to calculate total GPA (Encapsulation)
  double _calculateGPA() {
    double totalGpa = 0;
    for (var gpa in gpaList) {
      totalGpa += gpa;
    }
    return totalGpa;
  }

  // Method to display student details
  void displayDetails() {
    print("Name: $name\nID: $id\nCourses:");
    for (int i = 0; i < courses.length; i++) {
      print(" - ${courses[i]}(GPA: ${gpaList[i]})");
    }
    print("\nAverage GPA: ${_calculateGPA() / courses.length}\n");
  }
}

void main() {
  print("---Student Management System---");

  // Taking user input for student name
  print("Enter student name: ");
  String name = stdin.readLineSync() ?? "Name not entered";

  // Taking user input for student ID
  print("Enter student ID: ");
  String id = stdin.readLineSync() ?? "No id entered";

  // Creating a Student object
  Student s1 = Student(name, id);

  // Loop to keep program running until user exits
  while (true) {
    // Display menu options
    print(
      "\n1. Enroll in a course.\n2. Drop a course.\n3. View Student Details.\n0. Exit\nEnter your Choice: ",
    );
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        print("Enter course name: ");
        String e_course = stdin.readLineSync() ?? "Course not entered";
        print("Enter GPA of the course: ");
        double? gpa = double.parse(stdin.readLineSync()!);
        s1.enrollCourses(e_course, gpa); // Call enroll method
        break;

      case "2":
        print("Enter course name to drop: ");
        String d_course = stdin.readLineSync() ?? "Course not entered";
        s1.dropCourses(d_course); // Call drop method
        break;

      case "3":
        print("\nThe Details of the student: ");
        s1.displayDetails(); // Call display method
        break;

      case "0":
        print("Exiting the Student Management System\n");
        return; // Exit the program

      default:
        print("Enter a valid choice among 1, 2, 3, or 0\n"); // Error handling
    }
  }
}
