import 'package:grpc/grpc.dart' as grpc;
import 'connection.dart';

import 'package:product/services/product/lib/src/product_service.dart';
import 'package:product/services/produto/lib/src/produto_service.dart';

List<grpc.Service> getServices() {
  var list = <grpc.Service>[];

  list.add(ProductService(getConnection()));
  list.add(ProdutoService(getConnection()));
  return list;
}