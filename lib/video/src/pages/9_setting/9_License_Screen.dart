import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/9_setting/9_License.dart';

class License extends StatefulWidget {
  @override
  License_Screen createState() => License_Screen();
}

class License_Screen extends State<License> {
  get screenHeight => MediaQuery.of(context).size.height;
  get screenWidth => MediaQuery.of(context).size.width;

  static const List short_list = license_short;
  static const List long_list = license_long;

  final List<Map<String, dynamic>> _items = List.generate(
      30,
          (index) => {
        "id": index,
        "title": short_list[index],
        "content": long_list[index]
      });

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: DefaultAppBar(title: '오픈소스 라이선스'),
        body: Container (
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topCenter,
            child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (_, index) {
                  final item = _items[index];
                  return Card(
                // this key is required to save and restore ExpansionTile expanded state
                key: PageStorageKey(item['id']),
                color: Colors.white,
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 0),
                shape: RoundedRectangleBorder(
                    side:  BorderSide(color: Colors.black,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(9))
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 17),
                  childrenPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  expandedCrossAxisAlignment: CrossAxisAlignment.end,
                  maintainState: true,
                  title: Text(item['title']),
                  // contents
                  // trailing: Icon(
                  //   Icons.add_rounded,
                  //   // color: Colors.,
                  // ),
                  children: [
                    Text(item['content']),
                    // This button is used to remove this item

                  ],
                ),
              );
            })
        ));

  }

}








