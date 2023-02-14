class ImageRes {
  ImageRes._();
  static ImageRes _instance = ImageRes._();
  factory ImageRes() => _instance;

  String image = 'assets/image';
  String logo = 'assets/images/ic_app.png';
  String errorFile = 'assets/images/error_file.png';
  String sampleImage = 'https://p4.wallpaperbetter.com/wallpaper/467/426/507/nature-islam-istanbul-hagia-sophia-wallpaper-preview.jpg';
  String userDefault =
      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';
}