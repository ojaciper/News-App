import 'package:flutter/material.dart';
// import 'package:newsapp/models/article_model.dart';

// Widget customListTile(Article article) {
//   return Container(
//     margin: const EdgeInsets.all(12),
//     padding: const EdgeInsets.all(8),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 3,
//           )
//         ]),
//     child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           article.urlToImage == null
//               ? Image.asset('assets/images/img_error.jpg',
//                   height: 200, fit: BoxFit.cover)
//               : Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(
//                       article.urlToImage!,
//                     )),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//           const SizedBox(height: 8),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Text(
//               article.source!.name!,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             article.title!,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           )
//         ]),
//   );
// }

class CardTile extends StatelessWidget {
  String? urlImage;
  String? source;
  String? title;

  CardTile({Key? key, this.urlImage, this.source, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
            )
          ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            urlImage == null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/img_error.jpg',
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.network(
                    urlImage!,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                source!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ]),
    );
  }
}
