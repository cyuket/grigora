import 'package:dartz/dartz.dart';
import 'package:grigora/model/details_model.dart';
import 'package:grigora/model/resturant_model.dart';
import 'package:grigora/utills/http.dart';

class ApiService {
  Future<Either<String, List<ResturantModel>>> fetchResturant() async {
    try {
      final result = await fetchMethod("home");
      List<ResturantModel> resturantList =
          ResturantList.fromData(result["restaurants"]).resturantList;
      return Right(resturantList);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, DetailModel>> fetchDetail() async {
    try {
      final rockets = await fetchMethod("details");
      final DetailModel detail = DetailModel.fromJson(rockets);
      return Right(detail);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
