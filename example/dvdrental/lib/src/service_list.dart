import 'package:grpc/grpc.dart' as grpc;
import 'connection.dart';

import 'package:dvdrental/services/film_actor/lib/src/film_actor_service.dart';
import 'package:dvdrental/services/address/lib/src/address_service.dart';
import 'package:dvdrental/services/city/lib/src/city_service.dart';
import 'package:dvdrental/services/customer/lib/src/customer_service.dart';
import 'package:dvdrental/services/actor/lib/src/actor_service.dart';
import 'package:dvdrental/services/film_category/lib/src/film_category_service.dart';
import 'package:dvdrental/services/inventory/lib/src/inventory_service.dart';
import 'package:dvdrental/services/category/lib/src/category_service.dart';
import 'package:dvdrental/services/country/lib/src/country_service.dart';
import 'package:dvdrental/services/language/lib/src/language_service.dart';
import 'package:dvdrental/services/rental/lib/src/rental_service.dart';
import 'package:dvdrental/services/staff/lib/src/staff_service.dart';
import 'package:dvdrental/services/store/lib/src/store_service.dart';
import 'package:dvdrental/services/payment/lib/src/payment_service.dart';
import 'package:dvdrental/services/film/lib/src/film_service.dart';

List<grpc.Service> getServices() {
  var list = <grpc.Service>[];

  list.add(Film_actorService(getConnection()));
  list.add(AddressService(getConnection()));
  list.add(CityService(getConnection()));
  list.add(CustomerService(getConnection()));
  list.add(ActorService(getConnection()));
  list.add(Film_categoryService(getConnection()));
  list.add(InventoryService(getConnection()));
  list.add(CategoryService(getConnection()));
  list.add(CountryService(getConnection()));
  list.add(LanguageService(getConnection()));
  list.add(RentalService(getConnection()));
  list.add(StaffService(getConnection()));
  list.add(StoreService(getConnection()));
  list.add(PaymentService(getConnection()));
  list.add(FilmService(getConnection()));
  return list;
}