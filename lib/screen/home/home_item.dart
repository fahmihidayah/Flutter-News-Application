import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/resources/images.dart';

class ArticleHeaderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(ImageRes().sampleImage, fit: BoxFit.cover, height: 120, width: double.infinity,),
          ),
          SizedBox(height: 10,),
          Text(
            "Turki Mulai Membuka Negaranya untuk wisatawan asing.",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
            maxLines: 2,

          ),
          Text(
            "News",
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class ArticleRegularItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "29, Januari 2023 | 14:30",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "Mahasiswa UI berhasil membuat Aplikasi Pendeteksi berita hoax",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                ),
                Text(
                  "News",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(ImageRes().sampleImage, fit: BoxFit.cover, height: 80,),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
