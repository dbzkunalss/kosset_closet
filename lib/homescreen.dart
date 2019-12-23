import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nointernet.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<Widget> _tabList = [
    Container(
      color: Colors.teal,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.purple,
    )
  ];
  Widget hi;
  TabController _tabController;

  void hello() {
    isConnnected().then((value) => {});
  }

  Future<bool> isConnnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isConnnected(),
      builder: (context, snapshot) {
        while (snapshot.hasData) {
          if (snapshot.data == true) {
            return Scaffold(
              appBar: AppBar(
        
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return FlatButton(
              child: const Text('Sign out'),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                final FirebaseUser user = await _auth.currentUser();
                if (user == null) {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                  return;
                }
                _signOut();
                final String uid = user.uid;
                
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(uid + ' has successfully signed out.'),
                ));
               Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                          );
              },
            );
          })
        ],
      ),
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  items: [
                    BottomNavigationBarItem(
                        title: Text(""), icon: Icon(Icons.shopping_cart)),
                    BottomNavigationBarItem(
                        title: Text(""), icon: Icon(FontAwesomeIcons.home)),
                    BottomNavigationBarItem(
                        title: Text(""),
                        icon: Icon(FontAwesomeIcons.userCircle))
                  ],
                  onTap: (currentIndex) {
                    setState(() {
                      _currentIndex = currentIndex;
                      print(currentIndex);
                    });
                    _tabController.animateTo(_currentIndex);
                  }),
              body: SafeArea(
                  child: RefreshIndicator(
                color: Colors.black,
                onRefresh: isConnnected,
                child: Container(
                    child: TabBarView(
                  controller: _tabController,
                  children: _tabList,
                )),
              )),
            );
          } else {
            return Scaffold(body: NoInternet());
          }
        }
        return Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      },
    );
    // return Scaffold(
    //   bottomNavigationBar: BottomNavigationBar(
    //       currentIndex: _currentIndex,
    //       items: [
    //         BottomNavigationBarItem(
    //             title: Text(""), icon: Icon(Icons.shopping_cart)),
    //         BottomNavigationBarItem(
    //             title: Text(""), icon: Icon(FontAwesomeIcons.home)),
    //         BottomNavigationBarItem(
    //             title: Text(""), icon: Icon(FontAwesomeIcons.userCircle))
    //       ],
    //       onTap: (currentIndex) {
    //         setState(() {
    //           _currentIndex = currentIndex;
    //           print(currentIndex);
    //         });
    //         _tabController.animateTo(_currentIndex);
    //       }),
    //   body: SafeArea(
    //       child: RefreshIndicator(
    //           color: Colors.black,
    //           onRefresh: isConnnected,
    //           child: Container(
    //             child: FutureBuilder(
    //               future: isConnnected(),
    //               builder: (context, snapshot) {
    //                 while (snapshot.hasData) {
    //                   if (snapshot.data != true) {
    //                     return TabBarView(
    //                       controller: _tabController,
    //                       children: _tabList,
    //                     );
    //                   } else {
    //                     return NoInternet();
    //                   }
    //                 }
    //                 return Container(
    //                   alignment: Alignment.center,
    //                   child: CircularProgressIndicator(),
    //                 );
    //               },
    //             ),
    //           ))),
    // );
 
  }
   void _signOut() async {
    await _auth.signOut();
  }

}
