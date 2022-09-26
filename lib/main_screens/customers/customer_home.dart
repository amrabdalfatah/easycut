import 'package:easycut/main_screens/customers/booking.dart';
import 'package:easycut/main_screens/customers/favorite.dart';
import 'package:easycut/main_screens/customers/home.dart';
import 'package:easycut/main_screens/customers/notification.dart';
import 'package:easycut/main_screens/customers/search.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  List<Widget> pages = const [
    HomeScreen(),
    BookingScreen(),
    NotificationScreen(),
    FavoriteScreen(),
  ];

  List<Widget> titleAppBar = [
    Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 20,
        ),
        SizedBox(width: 8),
        Text(
          'Welcome ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          'Ahmed',
          style: TextStyle(
            color: Color(0xff0353a4),
            fontSize: 16,
          ),
        ),
      ],
    ),
    const Text(
      'Bookings',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),
    const Text(
      'Notification',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),
    const Text(
      'Favorite',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),
  ];

  void _onSelectedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: titleAppBar[_selectedIndex],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const SearchScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.isEndDrawerOpen
                  ? _scaffoldKey.currentState!.closeEndDrawer()
                  : _scaffoldKey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.menu),
            color: Colors.grey,
          ),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onSelectedItem,
        selectedItemColor: const Color(0xff0353a4),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints.expand(
                height: 200,
                width: double.infinity,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bkimage.png'),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Layla Mohamed Ibrahim',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Profile'),
                    trailing: const Icon(Icons.person),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Contact Us'),
                    trailing: const Icon(Icons.phone_android),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              trailing: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
