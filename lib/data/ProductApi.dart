import 'package:flutter_study/bean/product.dart';

class ProductApi {
  static List<Product> _data = [
    Product(
        title: "运动鞋 月销过万 男士低帮旅游百搭潮鞋韩国风",
        bandTags: ["运动休闲", "透气", "休闲风"],
        discountTags: ["天猫无忧购", "包邮"],
        price: "79",
        buyCount: "20万",
        address: "泉州",
        shopName: "每年管旗舰店",
        picUrl:
        "https://g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/51726086/O1CN01HrHZs01upQzSHDaGh_!!0-saturn_solar.jpg_580x580Q90.jpg_.webp"),
    Product(
        title: "特步鞋2019新品上市透气运动鞋男士夏季网面鞋休闲皮面防水跑步鞋",
        bandTags: ["优良缓震", "透气功能"],
        discountTags: ["包邮", "领券满400减去50"],
        price: "139",
        buyCount: "4233",
        address: "广州",
        shopName: "特步众淘专卖店",
        picUrl:
        "https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/856223573/O1CN01fqdxSf1cGTgJWf5FK_!!0-item_pic.jpg_580x580Q90.jpg_.webp"),
    Product(
        title: "运动鞋月销过万 刀锋战士 夏季跑步透气凉爽白鞋休闲运动白搭步鞋战士旅游跑步鞋",
        bandTags: ["优良包裹性", "防滑功能"],
        discountTags: ["满200减38", "包邮"],
        price: "129",
        buyCount: "9832",
        address: "合肥",
        shopName: "特步官方旗舰店",
        picUrl:
        "https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/3429178344/O1CN01u0vCML2BVbJhgtYVD_!!0-item_pic.jpg_580x580Q90.jpg_.webp"),
    Product(
        title: "Nike 耐克官方 NIKE TESSEN 男子运动鞋休闲鞋AA2160",
        bandTags: ["保暖", "青春潮流风"],
        discountTags: ["领券减50", "包邮"],
        price: "389",
        buyCount: "991",
        address: "上海",
        shopName: "nike官方旗舰店",
        picUrl:
        "https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/890482188/O1CN013YIXaH1S297pGZW4S_!!0-item_pic.jpg_580x580Q90.jpg_.webp"),
    Product(
        title: "361运动鞋男鞋夏季男士网鞋黑色361度轻便休闲鞋子网面透气跑步鞋",
        bandTags: ["鞋底防滑", "网红鞋"],
        discountTags: ["领券减39", "包邮"],
        price: "109",
        buyCount: "1.5万",
        address: "泉州",
        shopName: "瑞天运动专卖店",
        picUrl:
        "https://img.alicdn.com/bao/uploaded/i3/2196663066/O1CN01FEnnkB1YWGsltMwsZ_!!0-item_pic.jpg"),
    Product(
        title: "韩版帆布鞋男港风休闲板鞋百搭潮鞋低帮学生潮流情侣小白鞋子男夏",
        bandTags: ["舒适轻便", "透气不闷脚"],
        discountTags: ["领券减49", "包邮"],
        price: "39.9",
        buyCount: "2580",
        address: "温州",
        shopName: "写识旗舰店",
        picUrl:
        "https://g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i2/434330188/O1CN01mZuPz11DG8zhBTjiD_!!0-saturn_solar.jpg_580x580Q90.jpg_.webp"),
    Product(
        title: "花花公子男鞋夏季透气低帮帆布鞋男涂鸦潮鞋子韩版高帮百搭板鞋男",
        bandTags: ["时尚潮流", "韩国风"],
        discountTags: ["满300减39", "包邮"],
        price: "178",
        buyCount: "1234",
        address: "合肥",
        shopName: "博翔鞋类专营店",
        picUrl:
        "https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1795883083/O1CN01ofhz7t1DKGZOltM2U_!!197-0-lubanu.jpg_580x580Q90.jpg_.webp"),
    Product(
        title: "回力帆布鞋男高帮帆布鞋男鞋子男潮鞋男鞋夏季2019新款透气板鞋男",
        bandTags: ["超级轻便", "透气"],
        discountTags: ["满300减39", "包邮"],
        price: "69",
        buyCount: "4.5万+",
        address: "上海",
        shopName: "回力梅西专卖店",
        picUrl:
        "https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/2128794607/O1CN01fvdD521CAomdRGh3Q_!!41-0-lubanu.jpg_580x580Q90.jpg_.webp"),
    Product(
        title: "森马女网鞋透气2019爆款夏天百搭学生厚底老爹鞋ins潮网面运动鞋",
        bandTags: ["神马新款", "百搭潮流"],
        discountTags: ["领券立减30", "包邮"],
        price: "346",
        buyCount: "3万+",
        address: "温州",
        shopName: "senma鞋类旗舰店",
        picUrl:
        "https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/1119561178/O1CN01jz0Tgz1KZZ6w5uTV3_!!1119561178.jpg_580x580Q90.jpg_.webp"),
    Product(
        title: "红蜻蜓女鞋2019新款休闲平底百搭基础小白鞋女夏透气板鞋学生单鞋",
        bandTags: ["夏季透气", "平底鞋"],
        discountTags: ["包邮"],
        price: "98",
        buyCount: "897",
        address: "温州",
        shopName: "红蜻蜓女鞋官方旗舰店",
        picUrl:
        "https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/1695303019/O1CN013x1O3k1YAkFCwtxWh_!!0-item_pic.jpg_580x580Q90.jpg_.webp"),
  ];


  static Future<List<Product>> loadProducts(int page) async{
    await Future.delayed(Duration(seconds: 1));
    if (page <=2) return Future.value([..._data]);
    return Future.value([]);
  }
}
