import 'package:flutter/material.dart';
import '../models/pegawai_model.dart';
import 'package:my_apps/providers/pegawai_providers.dart';
import 'package:provider/provider.dart';
import './pegawai_add.dart';

class Pegawai extends StatelessWidget {

  // final data = [
  //   PegawaiModel(
  //     id: "1",
  //     pegawaiName: "Test 1",
  //     pegawaiGaji: "4500000",
  //     pegawaiUmur: "57",
  //     //profileImage: "",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Flutter Pegawai'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Provider.of<PegawaiProviders>(context, listen: false).getPegawai(),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder(
            future: Provider.of<PegawaiProviders>(context, listen: false).getPegawai(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Consumer<PegawaiProviders>(
                builder: (context, data, _) {
                  return ListView.builder(
                    itemCount: data.dataPegawai.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation : 8,
                        child: ListTile(
                          title: Text(
                            data.dataPegawai[i].pegawaiName,
                            style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text('Umur : ${data.dataPegawai[i].pegawaiUmur}'),
                          trailing: Text("\$${data.dataPegawai[i].pegawaiGaji}"),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Text('+'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PegawaiAdd()));
        },
      ),
    );
  }
}