import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/aboutus.dart';
import 'package:flutter_application_1/containsus.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/lang/applocal.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/settings.dart';

Widget TextForm({
  // ignore: non_constant_identifier_names
  required var Con,
  var type = TextInputType.text,
  @required var lable,
  @required var prefixIcon,
  @required var val,
  var obscureText = false,
  var suffixIcon,
  var fun_su,
  var ontap,
  var onchange,
  var onsubmit,
  var enable=true,
}) =>
    TextFormField(
      enabled: enable,
      onFieldSubmitted: onsubmit,
      onTap: ontap,
      controller: Con,
      onChanged: onchange,
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: lable,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: fun_su, icon: suffixIcon)
            : null,
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return val;
        } else {
          return null;
        }
      },
    );
Nav(context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (builder) => page),
  );
}
Navandremove(context, page) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (builder) => page), (route) => false);
}

drawer (context)=> Drawer(

        
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              color: Theme.of(context).backgroundColor,
            ),
            ListTile(
              title: Text("${getLang(context, "Home")}"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => home()));
                    
              },
            ),
            ListTile(
              title: Text("${getLang(context, "About Us")}"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => aboutus()));
              },
            ),
            ListTile(
              title: Text("${getLang(context, "Contains Us")}"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => containsus()));
              },
            ),
                        ListTile(
              title: Text("${getLang(context, "settings")}"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => settings()));
              },
            ),
             ListTile(
              title: Text("${getLang(context, "LogOut")}"),
              onTap: () {
                Navandremove(context, login());
              },
            ),
          ],
        ),
      );