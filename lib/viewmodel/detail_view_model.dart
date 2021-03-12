import 'package:dartz/dartz.dart';
import 'package:grigora/locator.dart';
import 'package:grigora/model/details_model.dart';

import 'package:grigora/services/api_service.dart';
import 'package:grigora/viewmodel/base_model.dart';

class DetailViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();

  DetailModel _detail;

  DetailModel get detial => _detail;

  Future<Either<String, DetailModel>> fetchDetail() async {
    setBusy(true);

    final response = await _apiService.fetchDetail();

    response.fold((l) => print(l), (r) {
      print("sjsj");
      _detail = r;
    });

    setBusy(false);
    return response;
  }
}
