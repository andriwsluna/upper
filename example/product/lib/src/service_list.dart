import 'package:grpc/grpc.dart' as grpc;
import 'connection.dart';
// ignore: avoid_relative_lib_imports
import '../services/product/lib/src/product_service.dart';
// ignore: avoid_relative_lib_imports
import '../services/produto/lib/src/produto_service.dart';

List<grpc.Service> getServices() {
  var list = <grpc.Service>[];

  list.add(ProductService(getConnection()));
  list.add(ProdutoService(getConnection()));
  return list;
}
