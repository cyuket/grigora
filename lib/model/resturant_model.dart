class ResturantList {
  final List<ResturantModel> resturantList;
  ResturantList({this.resturantList});

  factory ResturantList.fromData(List data) {
    var list = data;
    List<ResturantModel> newList =
        list.map((i) => ResturantModel.fromJson(i)).toList();
    return ResturantList(resturantList: newList);
  }
}

class ResturantModel {
  final dynamic id;
  final String name;
  final String frenchName;
  final String image;
  final String address;
  final String frenchAddress;
  final String pickup;
  final dynamic preparingTime;
  final String tableBooking;
  final bool busyStatus;
  final dynamic noOfSeats;
  final dynamic averageRating;
  final dynamic totalRating;

  ResturantModel({
    this.address,
    this.averageRating,
    this.busyStatus,
    this.frenchAddress,
    this.frenchName,
    this.id,
    this.image,
    this.name,
    this.noOfSeats,
    this.pickup,
    this.preparingTime,
    this.tableBooking,
    this.totalRating,
  });

  factory ResturantModel.fromJson(Map<String, dynamic> data) {
    if (data == null) return null;
    return ResturantModel(
      address: data["address"],
      averageRating: data["average_rating"],
      busyStatus: data["busy_status"],
      frenchAddress: data["french_address"],
      frenchName: data["french_name"],
      id: data["id"],
      image: data["image"],
      name: data["name"],
      noOfSeats: data["no_of_seats"],
      pickup: data["pickup"],
      preparingTime: data["preparing_time"],
      tableBooking: data["table_booking"],
      totalRating: data["total_rating"],
    );
  }
}
