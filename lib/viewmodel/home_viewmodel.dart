import 'package:dartz/dartz.dart';
import 'package:grigora/locator.dart';
import 'package:grigora/model/resturant_model.dart';

import 'package:grigora/services/api_service.dart';
import 'package:grigora/viewmodel/base_model.dart';

class HomeViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();

  List<ResturantModel> _list = [];

  List<ResturantModel> get resturant => _list;

  Future<Either<String, List<ResturantModel>>> fetchResturant() async {
    setBusy(true);

    final response = await _apiService.fetchResturant();

    response.fold((l) => print(l), (r) {
      print("sjsj");
      _list = r;
    });

    setBusy(false);
    return response;
  }
}
