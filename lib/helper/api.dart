import 'dart:convert';

import 'package:http/http.dart'as http;
class Api{
  Future<dynamic> get({required String url}) async {
    http.Response response=await http.get(Uri.parse(url));
    if (response.statusCode==200) {
      return  jsonDecode(response.body);
    }else throw Exception('there is proplem in satues code ${response.statusCode}');

  }
  //
  // post request for edit in end point...
  Future<dynamic> createPost({required String url, required Map body}) async {
    http.Response response=await http.post(Uri.parse('$url'), body: body);
    if (response.statusCode ==200 ) {
      return jsonDecode( response.body);
    }else {
      throw  Exception("Error while fetching data${response.statusCode} body is ${jsonDecode(response.body)}");
    }

 }
  //PUT OR Update
  Future<dynamic> Put({required String url,required Map body,})async{
    Map<String,String>header={};
    header.addAll({
      'Content-Type':'application/x-www-form-urlencoded'
    });
    http.Response response=await http.put(Uri.parse(url),body: body,headers:header );
    if (response.statusCode ==200 ) {
      return jsonDecode( response.body);
    }else {
      throw  Exception("Error while fetching data${response.statusCode} body is ${jsonDecode(response.body)}");
    }

   }

  }


