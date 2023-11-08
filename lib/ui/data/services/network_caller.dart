import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:taskmanager/ui/data/model/network_response.dart';

// class NetworkCaller{
//   Future<NetworkResponse> getRequest (String url) async{
//     try{
//       Response response= await get(Uri.parse(url));
//       if(response.statusCode==200){
//         return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
//       }else{
//         return NetworkResponse(false, response.statusCode, null);
//       }
//     }catch(e){
//       log(e.toString() as num);
//     }
//     return NetworkResponse(false, -1, null);
//   }
//
// }

// class NetworkCaller{
//   Future<NetworkResponse> getRequest(String url) async {
//     Response response = await get(Uri.parse(url));
//     try{
//       if(response.statusCode==200){
//         return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
//       }else{
//         return NetworkResponse(false, response.statusCode, null);
//       }
//     }catch(e){
//       log(e.toString() as num);
//     }
//     return NetworkResponse(false, -1, null);
//   }
// }

class NetworkCaller{
  //--------------------GetMethod----------------------
  Future<NetworkResponse> getRequest(String url) async{
    Response response = await get(Uri.parse(url));
    try{
      if(response.statusCode==200){
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      }
      else{
        return NetworkResponse(false, response.statusCode, null);
      }
    }catch(e){
      log(e.toString());
    }
  return NetworkResponse(false, -1, null);
  }
//--------------------------PostMethod-----------------
Future<NetworkResponse> postRequest(String url, Map<String,dynamic>body)async{
    Response response = await post(Uri.parse(url),headers: {
      'Content-type':'applications/json'
    }, body: jsonEncode(body),);

    log(response.statusCode.toString());
    log(response.body);
    
    try{
      if(response.statusCode==200){
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      }
      else{
        return NetworkResponse(false, response.statusCode, null);
      }
    }catch(e){
      log(e.toString());
    }
    
    return NetworkResponse(false,-1, null);
}
}