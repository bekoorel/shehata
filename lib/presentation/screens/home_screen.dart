// import 'package:flutter/material.dart';
// import 'package:sports/presentation/screens/countries_screen.dart';
// import 'package:sports/presentation/screens/login_screen.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text('User Name'),
//               accountEmail: Text('user@example.com'),
//             ),
//             ListTile(
//               title: Text('Logout'),
//               onTap: () {
//                // logout();
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: [
//           SportWidget(name: 'Football', image: 'assets/football.png'),
//           SportWidget(name: 'Basketball', image: 'assets/basketball.png'),
//           SportWidget(name: 'Cricket', image: 'assets/cricket.png'),
//           SportWidget(name: 'Tennis', image: 'assets/tennis.png'),
//         ],
//       ),
//     );
//   }
// }

// class SportWidget extends StatelessWidget {
//   final String name;
//   final String image;

//   SportWidget({required this.name, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (name == 'Football') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CountriesScreen()),
//           );
//         } else {
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               content: Text('Coming soon'),
//             ),
//           );
//         }
//       },
//       child: Card(
//         child: Column(
//           children: [
//             Image.asset(image),
//             Text(name),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sports/presentation/screens/countries_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('user@example.com'),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          SportWidget(sportName: 'Football'),
          SportWidget(sportName: 'Basketball'),
          SportWidget(sportName: 'Cricket'),
          SportWidget(sportName: 'Tennis'),
        ],
      ),
    );
  }
}

class SportWidget extends StatelessWidget {
  final String sportName;
  const SportWidget({required this.sportName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (sportName == 'Football') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CountriesScreen()));
        }
      },
      child: Card(
        child: Center(
          child: Text(sportName),
        ),
      ),
    );
  }
}
