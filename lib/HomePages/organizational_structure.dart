import 'package:flutter/material.dart';

// ignore: camel_case_types
class OrganizationalStructure extends StatefulWidget {
  // تاخذين اسم الكلاس:
  const OrganizationalStructure({super.key});

  @override
  State<OrganizationalStructure> createState() =>
      _OrganizationalStructureState();
}

class _OrganizationalStructureState extends State<OrganizationalStructure> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.green,
        height: 500,
        child: const Center(
          child: Column(
            children: [
              Text('المحتوى هنا'),
            ],
          ),
        ),
      ),
    );
  }
}
