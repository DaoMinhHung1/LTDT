import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// class CategoriesWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//         child: Row(children: [
//           Container(
//             height: 100,
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection("categories")
//                   .snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
//                 if (!streamSnapshort.hasData) {
//                   return Center(child: const CircularProgressIndicator());
//                 }
//                 return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   physics: BouncingScrollPhysics(),
//                   itemCount: streamSnapshort.data!.docs.length,
//                   itemBuilder: (ctx, index) {
//                     return Categories(
//                       categoryName: streamSnapshort.data!.docs[index]
//                           ["categoryName"],
//                       image: streamSnapshort.data!.docs[index]["categoryImage"],
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Single item
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                       offset: Offset(0, 3),
//                     )
//                   ]),
//               child: Image.asset(
//                 "images/cafe1.png",
//                 width: 50,
//                 height: 50,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                       offset: Offset(0, 3),
//                     )
//                   ]),
//               child: Image.asset(
//                 "images/cafe1.png",
//                 width: 50,
//                 height: 50,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                       offset: Offset(0, 3),
//                     )
//                   ]),
//               child: Image.asset(
//                 "images/cafe1.png",
//                 width: 50,
//                 height: 50,
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
//// Categories

class Categories extends StatelessWidget {
  final String image;
  final String categoryName;

  const Categories({
    Key? key,
    required this.categoryName,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(categoryName),
        ],
      ),
    );
  }
}
