import 'package:flutter/material.dart';

class DataBase {
  static List<Map<String, dynamic>> students = [
    {
      'name': 'prem prakash gupta',
      'email': "abc@gmail.com",
      'reg': 12345678900,
      'batch': 2019,
      'branch': 'CSE',
    },
    {
      'name': 'John Doe',
      'email': "john.doe@example.com",
      'reg': 9876543210,
      'batch': 2020,
      'branch': 'EEE',
    },
    {
      'name': 'Jane Smith',
      'email': "jane.smith@example.com",
      'reg': 5555555555,
      'batch': 2021,
      'branch': 'Mechanical',
    },
    {
      'name': 'Alice Johnson',
      'email': "alice.johnson@example.com",
      'reg': 9999999999,
      'batch': 2022,
      'branch': 'Civil',
    },
    {
      'name': 'Bob Williams',
      'email': "bob.williams@example.com",
      'reg': 1111111111,
      'batch': 2020,
      'branch': 'CSE',
    },
    {
      'name': 'Emma Davis',
      'email': "emma.davis@example.com",
      'reg': 2222222222,
      'batch': 2023,
      'branch': 'EEE',
    },
    {
      'name': 'Michael Anderson',
      'email': "michael.anderson@example.com",
      'reg': 3333333333,
      'batch': 2022,
      'branch': 'Mechanical',
    },
    {
      'name': 'Sophia Lee',
      'email': "sophia.lee@example.com",
      'reg': 4444444444,
      'batch': 2021,
      'branch': 'Civil',
    },
    {
      'name': 'James Taylor',
      'email': "james.taylor@example.com",
      'reg': 6666666666,
      'batch': 2023,
      'branch': 'CSE',
    },
    {
      'name': 'Olivia Moore',
      'email': "olivia.moore@example.com",
      'reg': 7777777777,
      'batch': 2022,
      'branch': 'EEE',
    },
  ];
  static List<Map<String, dynamic>> teachers = [
    {
      'teacher_id': 'chbhjcbjdbjcb',
      'name': 'Olivia Moore',
      'email': "olivia.moore@example.com",
      'reg': 45378,
      'joining_date': '12/02/2018'
    },
    {
      'teacher_id': 'abc123',
      'name': 'John Doe',
      'email': "john.doe@example.com",
      'reg': 12345,
      'joining_date': '01/10/2020'
    },
    {
      'teacher_id': 'xyz456',
      'name': 'Jane Smith',
      'email': "jane.smith@example.com",
      'reg': 67890,
      'joining_date': '05/06/2019'
    },
    {
      'teacher_id': 'pqr789',
      'name': 'Michael Anderson',
      'email': "michael.anderson@example.com",
      'reg': 54321,
      'joining_date': '09/12/2021'
    },
    {
      'teacher_id': 'lmn456',
      'name': 'Sophia Lee',
      'email': "sophia.lee@example.com",
      'reg': 98765,
      'joining_date': '03/08/2017'
    },
  ];
  static List<Map<String, dynamic>> classes = [
    {
      'class_id': "jhbe6522",
      'name': 'CSE',
      'background': '',
      'image':
          'https://images.unsplash.com/photo-1610563166150-b34df4f3bcd6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcHV0ZXIlMjBzY2llbmNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'teacher_id': 'jhbdbjdd',
      'allocated_class': [
        '15/02/2020T12:00PM',
      ],
      'issued_assignment': [
        {
          'name': "Mathematics",
          'due_date': '12/02/2020',
          'issued_date': '08/02/2020',
          'submitted': true
        }
      ],
      'submitted_assignment': [
        {
          'name': "Mathematics",
          'due_date': '12/02/2020',
          'issued_date': '08/02/2020',
          'submitted_date': '11/02/2020',
          'submitted': true
        }
      ],
    },
    {
      'class_id': "ab123",
      'name': 'EEE',
      'background': Colors.green,
      'image': '',
      'teacher_id': 'cd456',
      'allocated_class': [
        '20/02/2020T02:00PM',
        '25/02/2020T03:30PM',
      ],
      'issued_assignment': [
        {
          'name': "Physics",
          'due_date': '18/02/2020',
          'issued_date': '12/02/2020',
          'submitted': false
        },
        {
          'name': "Electronics",
          'due_date': '20/02/2020',
          'issued_date': '15/02/2020',
          'submitted': true
        }
      ],
      'submitted_assignment': [
        {
          'name': "Physics",
          'due_date': '18/02/2020',
          'issued_date': '12/02/2020',
          'submitted_date': '17/02/2020',
          'submitted': true
        },
        {
          'name': "Electronics",
          'due_date': '20/02/2020',
          'issued_date': '15/02/2020',
          'submitted_date': '19/02/2020',
          'submitted': true
        }
      ],
    },
    {
      'class_id': "xyz789",
      'name': 'Mechanical',
      'background': Colors.greenAccent,
      'image': '',
      'teacher_id': 'uvw012',
      'allocated_class': [
        '10/02/2020T09:00AM',
        '12/02/2020T11:30AM',
      ],
      'issued_assignment': [
        {
          'name': "Engineering Drawing",
          'due_date': '08/02/2020',
          'issued_date': '04/02/2020',
          'submitted': true
        },
        {
          'name': "Thermodynamics",
          'due_date': '10/02/2020',
          'issued_date': '06/02/2020',
          'submitted': false
        }
      ],
      'submitted_assignment': [
        {
          'name': "Engineering Drawing",
          'due_date': '08/02/2020',
          'issued_date': '04/02/2020',
          'submitted_date': '07/02/2020',
          'submitted': true
        },
        {
          'name': "Thermodynamics",
          'due_date': '10/02/2020',
          'issued_date': '06/02/2020',
          'submitted_date': null,
          'submitted': false
        }
      ],
    },
    {
      'class_id': "pqrs123",
      'name': 'Civil',
      'background': Colors.blueAccent,
      'image': '',
      'teacher_id': 'tuvw345',
      'allocated_class': [
        '05/02/2020T10:30AM',
        '07/02/2020T01:00PM',
      ],
      'issued_assignment': [
        {
          'name': "Structural Analysis",
          'due_date': '03/02/2020',
          'issued_date': '30/01/2020',
          'submitted': true
        },
        {
          'name': "Concrete Technology",
          'due_date': '05/02/2020',
          'issued_date': '01/02/2020',
          'submitted': true
        }
      ],
      'submitted_assignment': [
        {
          'name': "Structural Analysis",
          'due_date': '03/02/2020',
          'issued_date': '30/01/2020',
          'submitted_date': '02/02/2020',
          'submitted': true
        },
        {
          'name': "Concrete Technology",
          'due_date': '05/02/2020',
          'issued_date': '01/02/2020',
          'submitted_date': '04/02/2020',
          'submitted': true
        }
      ],
    },
    {
      'class_id': "lmn789",
      'name': 'Chemical',
      'background': Colors.orange,
      'image': '',
      'teacher_id': 'hijk012',
      'allocated_class': [
        '03/02/2020T11:00AM',
        '06/02/2020T02:30PM',
      ],
      'issued_assignment': [
        {
          'name': "Organic Chemistry",
          'due_date': '01/02/2020',
          'issued_date': '28/01/2020',
          'submitted': false
        },
        {
          'name': "Chemical Engineering Principles",
          'due_date': '03/02/2020',
          'issued_date': '30/01/2020',
          'submitted': true
        }
      ],
      'submitted_assignment': [
        {
          'name': "Organic Chemistry",
          'due_date': '01/02/2020',
          'issued_date': '28/01/2020',
          'submitted_date': null,
          'submitted': false
        },
        {
          'name': "Chemical Engineering Principles",
          'due_date': '03/02/2020',
          'issued_date': '30/01/2020',
          'submitted_date': '02/02/2020',
          'submitted': true
        }
      ],
    },
  ];
}
