import 'package:flutter/material.dart';
import 'package:randompeople/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> userDataList = [];

  // ambil data dari services.dart
  void loadData() async {
    List<Map<String, dynamic>> data = await fetchUserData();
    setState(() {
      userDataList = data;
    });
  }

  // bentuk data pada homescreen
  @override
  void initState() {
    super.initState();
    loadData();
  }

  // kirim ke detailScreen (single data)
  void toDetailScreen(Map<String, dynamic> personData) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: personData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Participant'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: userDataList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userDataList.length,
              itemBuilder: (context, index) {
                final userData = userDataList[index];
                return Container(
                  child: ListTile(
                    onTap: () {
                      toDetailScreen(userData);
                      print("Pressed ${userData['name']}");
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        userData['picture']['thumbnail'],
                      ),
                    ),
                    title: Text(
                      '${userData['name']['title']} ${userData['name']['first']} ${userData['name']['last']}',
                    ),
                    subtitle: Text('Gender: ${userData['gender']}'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loadData(); // Fetch new user data when the button is pressed
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
    );
  }
}
