import 'package:flutter/material.dart';

import '../models/ChatEntity.dart';
import '../models/Image_model.dart';
import '../repo/image_repo.dart';

class AddNewImages extends StatelessWidget {
  Function(String) sendImage;
  AddNewImages({Key? key ,required this.sendImage}) : super(key: key);
  ImageRepo _imgRepo = ImageRepo();
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: FutureBuilder(
        future: _imgRepo.getImageFromJson(),
        builder: (BuildContext context , AsyncSnapshot<List<apiImage>> snapshot){
          if(snapshot.hasData)
            {
              return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width*0.5
              ), itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Image.network(snapshot.data![index].urlSmallSize
                  , ),
                onTap: () {
                    print("Inside the gesture detector");
                    print(snapshot.data![index].urlSmallSize);
                  sendImage(snapshot.data![index].urlSmallSize);
                },
                );
              },itemCount: snapshot.data?.length);
            }
          else
          if(snapshot.hasError)
            {
              print("Reached inside the hasError part");
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('The error is ${snapshot.error}'),
              );
            }
            // return Image.network(snapshot.data![1].urlMediumSize);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
                child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
