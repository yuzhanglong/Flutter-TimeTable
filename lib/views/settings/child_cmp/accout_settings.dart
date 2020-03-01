import 'package:flutter/material.dart';
import 'package:zucc_helper/views/login/child_cmp/set_password.dart';


class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 41, 47, 93),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 41, 47, 93),
      body: Container(
        child: Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.perm_identity, color: Colors.white, size: 75,),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
                  height: MediaQuery.of(context).size.height - 172,
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.vpn_key, color: Colors.white,),
                        title: Row(
                          children: <Widget>[
                            Text("修改密码", style: TextStyle(color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return SetPassword();
                              }
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
