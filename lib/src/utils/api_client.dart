import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart'as http;

class ApiClient{

  static final ApiClient _singleton=ApiClient._internal();
  factory ApiClient(){
    return _singleton;
  }
  ApiClient._internal();

  final String _baseURL="https://dropy.preview.webgee.cloud/api/providers";
  final http.Client _client=http.Client();

  Map<String,String> _headers(){
    Map<String,String> headers={
      'Content-Type':'application/json',
    };
    return headers;
  }

  void get({
    required String endpoint,
    required Function(dynamic response) onSuccess,
    required Function(dynamic response)onError,
    bool external=false
  })async{
    try{
      final http.Response response=await _client.get(external? Uri.parse(endpoint) : Uri.parse(_baseURL+endpoint),headers: _headers());
      log("$endpoint ======> ${response.body}");
      _handleResponse(response: response,onSuccess: onSuccess, onError: onError);
    }on http.ClientException catch(e) {
      onError({"error":e.message});
    }catch(e){
      onError({"error":e.toString()});
    }
  }

  void post({
    required String endpoint,
    Map body=const{},
    required Function(dynamic response) onSuccess,
    required Function(dynamic response)onError,
    bool external=false
  })async{
    try{
      final http.Response response=await _client.post(external? Uri.parse(endpoint) : Uri.parse(_baseURL+endpoint),body: jsonEncode(body),headers: _headers());
      log("$endpoint ======> ${response.body}");
      _handleResponse(response: response,onSuccess: onSuccess, onError: onError);
    }on http.ClientException catch(e) {
      onError({"error":e.message});
    }catch(e){
      onError({"error":e.toString()});
    }
  }

  void postMultipart({
    required String endpoint,
    Map body=const{},
    Map<String,File> files=const{},
    required Function(dynamic response) onSuccess,
    required Function(dynamic response)onError,
    bool external=false
  })async{
    try{
      final http.MultipartRequest multipartRequest= http.MultipartRequest('POST',external? Uri.parse(endpoint) : Uri.parse(_baseURL+endpoint));
      multipartRequest.headers.addAll(_headers());
      body.forEach((key, value) {
        multipartRequest.fields[key]=value;
      });
      files.forEach((key,file) async{
        var multipartFile= await http.MultipartFile.fromPath(key,file.path);
        multipartRequest.files.add(multipartFile);
      });
      final http.StreamedResponse streamedResponse=await multipartRequest.send();
      final http.Response response=await http.Response.fromStream(streamedResponse);
      log("$endpoint ======> ${response.body}");
      _handleResponse(response: response,onSuccess: onSuccess, onError: onError);
    }on http.ClientException catch(e) {
      onError({"error":e.message});
    }catch(e){
      onError({"error":e.toString()});
    }
  }

  void patch({
    required String endpoint,
    dynamic body,
    required Function(dynamic response) onSuccess,
    required Function(dynamic response)onError,
    bool external=false
  })async{
    try{
      final http.Response response=await _client.patch(external? Uri.parse(endpoint) : Uri.parse(_baseURL+endpoint),body: jsonEncode(body),headers: _headers());
      log("$endpoint ======> ${response.body}");
      _handleResponse(response: response,onSuccess: onSuccess, onError: onError);
    }on http.ClientException catch(e) {
      onError({"error":e.message});
    }catch(e){
      onError({"error":e.toString()});
    }
  }

  void put({
    required String endpoint,
    Map body=const{},
    required Function(dynamic response) onSuccess,
    required Function(dynamic response)onError,
    bool external=false
  })async{
    try{
      final http.Response response=await _client.put(external? Uri.parse(endpoint) : Uri.parse(_baseURL+endpoint),body:jsonEncode(body),headers: _headers());
      log("$endpoint ======> ${response.body}");
      _handleResponse(response: response,onSuccess: onSuccess, onError: onError);
    }on http.ClientException catch(e) {
      onError({"error":e.message});
    }catch(e){
      onError({"error":e.toString()});
    }
  }

  void delete({
    required String endpoint,
    required Function(dynamic response) onSuccess,
    required Function(dynamic response)onError,
    bool external=false
  })async{
    try{
      final http.Response response=await _client.delete(external? Uri.parse(endpoint) : Uri.parse(_baseURL+endpoint),headers: _headers());
      log("$endpoint ======> ${response.body}");
      _handleResponse(response: response,onSuccess: onSuccess, onError: onError);
    }on http.ClientException catch(e) {
      onError({"error":e.message});
    }catch(e){
      onError({"error":e.toString()});
    }
  }

  void _handleResponse({required dynamic response,required Function(dynamic response) onSuccess,required Function(dynamic response) onError}){
    if(response.statusCode>=200&&response.statusCode<300){
      onSuccess(json.decode(response.body));
    }else{
      onError(json.decode(response.body));
    }
  }

}