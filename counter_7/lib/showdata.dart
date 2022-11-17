import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/budgethandler.dart';

class ShowDataPage extends StatefulWidget {
  const ShowDataPage({super.key});

  @override
  State<ShowDataPage> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowDataPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Budget"),
      ),
        
      // Menambahkan drawer menu
      drawer: buildDrawer(context),

      body: SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: ListBudget.data
              .map((budget) => Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.15),
                      blurRadius: 20.0, // soften the shadow                        
                      offset: const Offset(1.0, 1.0,),
                      )
                    ],
              ),

          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          child: SizedBox(
            height: 100,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                    MainAxisAlignment
                      .spaceBetween,
                      children: [
                        Text(
                          budget.judul,
                          style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                          ),
                        Text(
                          "${budget.date.day}/${budget.date.month}/${budget.date.year}",
                          ),
                        ]
                    ),
                const Spacer(),
                Row(
                  mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                  children: [
                    Text(budget.nominal
                      .toString()),
                    Text(budget.jenis)
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                ),
              )
            ).toList()
          )
        )
      )
    );
  }
}