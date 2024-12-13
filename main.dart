import 'package:flutter/material.dart';
import 'modules/appointments/appointments_tab.dart';
import 'modules/contacts/contacts_tab.dart';
import 'modules/notes/notes_tab.dart';
import 'modules/tasks/tasks_tab.dart';

void main() {
  runApp(PersonalInfoManagerApp());
}

class PersonalInfoManagerApp extends StatelessWidget {
  const PersonalInfoManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Information Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info Manager'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Appointments', icon: Icon(Icons.calendar_today)),
            Tab(text: 'Contacts', icon: Icon(Icons.contacts)),
            Tab(text: 'Notes', icon: Icon(Icons.note)),
            Tab(text: 'Tasks', icon: Icon(Icons.check_circle)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AppointmentsTab(),
          ContactsTab(),
          NotesTab(),
          TasksTab(),
        ],
      ),
    );
  }
}
