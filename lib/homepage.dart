import 'package:contactbook/userdetails.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> user = [
    User(
        name: "Andrew",
        phoneNumber: "9010203045"),

    User(
        name: "Toby", phoneNumber: "9638523695"),
    User(
      name: "Arjun",
      phoneNumber: "7418529632",
    ),
    User(
        name: "Tom", phoneNumber: "852963412"),
    User(
        name: "Khan",
        phoneNumber: "8529631475"
    ),
    User(name: "Christi", phoneNumber: "7896541236"),
    User(
      name: "Decaprio",
      phoneNumber: "7893214565",
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 44, 98, 247),
          title: const Text("Contact Book"),
          centerTitle: true,
          actions: const [Icon(Icons.more_vert)],
        ),
        body: ListView(children: <Widget>[
          IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 40, 10, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "SEARCH",
                          hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.people_alt,
                    size: 43,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 43,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: user.map((user) {
              return UserCard(user: user);
            }).toList(),
          )
        ]));
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({required this.user});
  @override
  Widget build(BuildContext context) {

    return Card(
      color: const Color.fromRGBO(196, 196, 196, 1),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserDetails(
                    user: user,
                  )));
        },
        leading: const CircleAvatar(backgroundImage: NetworkImage("https://www.interactivesearchmarketing.com/wp-content/uploads/2014/06/png-vs-jpeg.jpg")),
        title: Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(user.phoneNumber),
        trailing: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.call,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),

            ],
          ),
        ),
      ),
    );
  }
}