// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> personData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Person Detail"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(personData['picture']['large']),
                  radius: 30,
                ),
                title: Text(
                  '${personData['name']['title']} ${personData['name']['first']} ${personData['name']['last']}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${personData['email']}',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Gender'),
                    subtitle: Text('${personData['gender']}'),
                  ),
                  ListTile(
                    title: Text('Country'),
                    subtitle: Text('${personData['location']['country']}'),
                  ),
                  ListTile(
                    title: Text('City'),
                    subtitle: Text('${personData['location']['city']}'),
                  ),
                  ListTile(
                    title: Text('State'),
                    subtitle: Text('${personData['location']['state']}'),
                  ),
                  ListTile(
                    title: Text('Postcode'),
                    subtitle: Text('${personData['location']['postcode']}'),
                  ),
                  ListTile(
                    title: Text('Coordinates'),
                    subtitle: Text(
                      '${personData['location']['coordinates']['latitude']}, ${personData['location']['coordinates']['longitude']}',
                    ),
                  ),
                  ListTile(
                    title: Text('Timezone'),
                    subtitle: Text(
                        '${personData['location']['timezone']['description']}'),
                  ),
                  ListTile(
                    title: Text('Phone'),
                    subtitle: Text('${personData['phone']}'),
                  ),
                  ListTile(
                    title: Text('Cell'),
                    subtitle: Text('${personData['cell']}'),
                  ),
                  ListTile(
                    title: Text('Date of Birth'),
                    subtitle: Text('${personData['dob']['date']}'),
                  ),
                  ListTile(
                    title: Text('Age'),
                    subtitle: Text('${personData['dob']['age']}'),
                  ),
                  ListTile(
                    title: Text('Registered Date'),
                    subtitle: Text('${personData['registered']['date']}'),
                  ),
                  ListTile(
                    title: Text('Registered Age'),
                    subtitle: Text('${personData['registered']['age']}'),
                  ),
                  ListTile(
                    title: Text('ID'),
                    subtitle: Text(
                        '${personData['id']['name']}, ${personData['id']['value']}'),
                  ),
                  ListTile(
                    title: Text('National'),
                    subtitle: Text('${personData['nat']}'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
