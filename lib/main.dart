import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> colorOptions = [
    {'name': 'Roxo', 'color': Colors.deepPurple},
    {'name': 'Verde', 'color': Colors.green},
    {'name': 'Vermelho', 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: DataBodyWidget(objects: dataObjects),
        ),
        bottomNavigationBar: NewNavBar(
          icons: [
            Icons.coffee_outlined,
            Icons.local_drink_outlined,
            Icons.flag_outlined,
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends AppBar {
  MyAppBar()
      : super(
          title: const Text("Dicas"),
          actions: <Widget>[
            PopupMenuButton<Color>(
              icon: Icon(Icons.color_lens),
              itemBuilder: (BuildContext context) {
                final appState = context.findAncestorStateOfType<MyAppState>();
                return appState!.colorOptions.map((option) {
                  return PopupMenuItem<Color>(
                    value: option['color'],
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: option['color'],
                        ),
                        SizedBox(width: 8),
                        Text(option['name']),
                      ],
                    ),
                  );
                }).toList();
              },
            )
          ],
        );
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;
  NewNavBar({required this.icons});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: icons
          .map((icon) => BottomNavigationBarItem(
                icon: Icon(icon),
                label: '',
              ))
          .toList(),
    );
  }
}

var dataObjects = [
  {
    "name": "La Fin Du Monde",
    "style": "Bock",
    "ibu": "65"
  },
  {
    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "name": "Duvel", 
    "style": "Pilsner", 
    "ibu": "82"
  },
  {
    "name": "La Fin Du Monde",
    "style": "Bock",
    "ibu": "65"
  },
  {
    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "name": "Duvel", 
    "style": "Pilsner", 
    "ibu": "82"
  },
  {
    "name": "La Fin Du Monde",
    "style": "Bock",
    "ibu": "65"
  },
  {
    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "name": "Duvel", 
    "style": "Pilsner", 
    "ibu": "82"
  },
  {
    "name": "La Fin Du Monde",
    "style": "Bock",
    "ibu": "65"
  },
  {
    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "name": "Duvel", 
    "style": "Pilsner", 
    "ibu": "82"
  }
];

class DataBodyWidget extends StatelessWidget {

  List objects;
  DataBodyWidget( {this.objects = const [] });

  @override
  Widget build(BuildContext context) {

    var columnNames = ["Nome","Estilo","IBU"],
      propertyNames = ["name", "style", "ibu"];
    return Center(
      child: DataTable(
        columns: columnNames.map( 
            (name) => DataColumn(
              label: Expanded(
                  child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))
              )
            )
        ).toList(),
        rows: objects.map( 
          (obj) => DataRow(
              cells: propertyNames.map(
                (propName) => DataCell(Text(obj[propName]))
              ).toList()
            )
          ).toList()
      ),
    );
  }
}