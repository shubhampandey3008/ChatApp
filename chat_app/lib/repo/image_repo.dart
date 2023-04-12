import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/Image_model.dart';

class ImageRepo {

  Future<List<apiImage>> getImageFromJson() async {
    try {
      Uri endpointUrl = Uri.parse('https://pixelford.com/api2/images');
      // var circularTimeout = new Duration(seconds: 3);
      final response = await http.get(endpointUrl);
      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic> decodeResponse = jsonDecode(response.body) as List;
        print(decodeResponse.length);
        print("reached here");
        List<apiImage> _imagesInList = decodeResponse.map((entity) {
          return apiImage.fromJson(entity);
        }).toList();
        return _imagesInList;
      }

      // throw Exception("The image was not able to load");
      // print("And finally the value of url is : " + _imagesInList[0].urlSmallSize);
    } on SocketException{
      throw Exception("Please turn on the internet");
    } on HttpException{
      throw Exception(" This is what i dont want");
    }

    throw Exception("Unknown exception");
  }
}
