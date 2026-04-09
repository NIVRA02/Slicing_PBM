import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _fullName = TextEditingController(text: 'Ayano Nana');
  final _email = TextEditingController(text: 'ayanonana@gmail.com');
  final _pass = TextEditingController(text: 'ayano123321');
  final _slogan = TextEditingController(text: 'Hello every body, i will...');

  @override
  Widget build(BuildContext context) {
    const primaryPink = Color(0xFFE95F6D);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
        title: const Text('Edit profile', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text('Done', style: TextStyle(color: primaryPink, fontWeight: FontWeight.bold))
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=ayano')
                  ),
                  const Icon(Icons.edit_outlined, color: Colors.white, size: 30),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
                'Coba  - coba \n cihuy.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey)
            ),
            const SizedBox(height: 30),
            _inputField('FULL NAME', _fullName),
            _inputField('EMAIL', _email),
            _inputField('PASSWORD', _pass, isPass: true),
            _inputField('SLOGAN', _slogan),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryPink,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryPink,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              _navItem(Icons.home, 'Home'),
              const SizedBox(width: 20),
              _navItem(Icons.calendar_month, 'Events'),
            ]),
            Row(children: [
              _navItem(Icons.search, 'Community'),
              const SizedBox(width: 20),
              _navItem(Icons.person, 'Profile', active: true),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController ctrl, {bool isPass = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 8),
        TextField(
          controller: ctrl,
          obscureText: isPass,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _navItem(IconData icon, String label, {bool active = false}) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: active ? Colors.white : Colors.white70),
          Text(
              label,
              style: TextStyle(
                  color: active ? Colors.white : Colors.white70,
                  fontSize: 10
              )
          ),
        ],
      ),
    );
  }
}