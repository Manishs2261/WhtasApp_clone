import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
   StatusPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green.shade50,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
              child: const Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xff01937c),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
            child: const Icon(
              Icons.camera_alt,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ListTile(
                leading: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red[100],
                          border: Border.all(color: Colors.green, width: 3)),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      top: 28,
                      left: 28,
                      child: Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                title: const Text(
                  "My status",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Tap to add status update"),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.green,
                ),
              );
            } else if (index == 1) {
              return const Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Recent updates",
                ),
              );
            } else if (index < 6) {
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue[50],
                      border: Border.all(color: Colors.green, width: 3)),
                  child: const Icon(Icons.person),
                ),
                title: const Text(
                  "Manish sahu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Today, 12:20 PM"),
              );
            } else if (index == 6) {
              return const Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("Viewed updates"),
              );
            } else {
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue[50],
                      border: Border.all(color: Colors.green, width: 3)),
                  child: const Icon(Icons.person),
                ),
                title: const Text(
                  "Manish sahu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Today, 12:20 PM"),
              );
            }
          }),
    );
  }
}