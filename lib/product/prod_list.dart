import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/bean/product.dart';
import 'package:flutter_study/common/refresh_list.dart';
import 'package:flutter_study/data/ProductApi.dart';
import 'package:flutter_study/product/prod_item.dart';

class ProdList extends StatefulWidget {
  @override
  _ProdListState createState() => _ProdListState();
}

class _ProdListState extends State<ProdList> {
  final List<Product> products = [];
  var page = 1;
  var hasMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("商品列表"),
        ),
        body: RefreshList(
          itemCount: products.length,
          onRefresh: ()=>loadData(),
          hasMoreData: hasMore,
          loadMore: () => loadData(isLoadMore: true),
          itemBuilder: (c, i) => ProdItem(
            product: products[i],
          ),
        ));
  }

  Future loadData({bool isLoadMore = false}) async {
    if (isLoadMore) {
      page += 1;
    } else {
      page = 1;
      products.clear();
    }
    var data = await ProductApi.loadProducts(page);

    if (data.isNotEmpty) {
      setState(() {
        hasMore = true;
        products.addAll(data);
      });
    } else {
      setState(() {
        hasMore = false;
      });
    }
  }
}
