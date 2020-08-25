import 'package:my_apps/pages/pegawai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pegawai_providers.dart';

class PegawaiAdd extends StatefulWidget {
  @override
  _PegawaiAddState createState() => _PegawaiAddState();
}

class _PegawaiAddState extends State<PegawaiAdd> {

  bool _isLoading = false;
  final snackbarKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nip = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _gaji = TextEditingController();
  final TextEditingController _umur = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode gajiNode = FocusNode();
  FocusNode umurNode = FocusNode();

  void submit(BuildContext context) {

    if(!_isLoading) {
      setState((){
        _isLoading = true;
      });
    }

    Provider.of<PegawaiProviders>(context, listen: false).savePegawai(_nip.text, _name.text, _gaji.text, _umur.text).then((res) {
      if(res) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Pegawai()));
      } else {
        var snackbar = SnackBar(
          content: Text('Error'),
          );
          snackbarKey.currentState.showSnackBar(snackbar);
          setState((){
            _isLoading = false;
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: snackbarKey,
      appBar: AppBar(
        title: Text('Tambah Pegawai'),
        actions: <Widget>[
          FlatButton(
            child: _isLoading
            ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
            : Icon(
               Icons.save,
               color: Colors.white,
             ),
            onPressed: () => submit(context),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Form
            TextField(
              controller: _nip,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'NIP Pegawai',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(nameNode);
              },
            ),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Nama Lengkap Pegawai',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(gajiNode);
              },
            ),
            TextField(
              controller: _gaji,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Gaji Pegawai',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(umurNode);
              },
            ),
            TextField(
              controller: _umur,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                ),
                hintText: 'Umur Pegawai',
              ),
            ),
          ],
        ),
      ),
    );
  }
}