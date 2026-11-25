import 'package:flutter/material.dart';

void main() {
  runApp(const BottomNavLab());
}

class Car {
  Car(this.make, this.model, this.price);

  final String make;
  final int model;
  final int price;
}

class BottomNavLab extends StatelessWidget {
  const BottomNavLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CarTablePage(),
    );
  }
}

class CarTablePage extends StatefulWidget {
  const CarTablePage({super.key});

  @override
  State<CarTablePage> createState() => _CarTablePageState();
}

class _CarTablePageState extends State<CarTablePage> {

  List<Car> cars = [
    Car('Honda', 2021, 35000),
    Car('Toyota', 2011, 6000),
    Car('BMW', 2010, 9000),
  ];

  int? sortColumnIndex;
  bool sortAscending = true;

  void sortBy(
    int columnIndex,
    bool ascending,
    int Function(Car a, Car b) compare,
  ) {
    setState(() {
      cars.sort(
        (a, b) => ascending
            ? compare(a, b)
            : compare(b, a),
      );

      sortColumnIndex = columnIndex;
      sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataTable Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: DataTable(
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAscending,

          border: TableBorder.all(color: Colors.black),

          columns: [
            DataColumn(
              label: const Text('Car Make'),
              onSort: (i, asc) {
                sortBy(
                  i,
                  asc,
                  (a, b) => a.make.compareTo(b.make),
                );
              },
            ),
            DataColumn(
              label: const Text('Model'),
              onSort: (i, asc) {
                sortBy(
                  i,
                  asc,
                  (a, b) => a.model.compareTo(b.model),
                );
              },
            ),
            DataColumn(
              label: const Text('Price'),
              onSort: (i, asc) {
                sortBy(
                  i,
                  asc,
                  (a, b) => a.price.compareTo(b.price),
                );
              },
            ),
          ],

          rows: cars.map((car) {
            return DataRow(
              cells: [
                DataCell(Text(car.make)),
                DataCell(Text(car.model.toString())),
                DataCell(Text(car.price.toString())),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}