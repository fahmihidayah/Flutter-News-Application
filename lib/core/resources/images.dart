class ImageRes {
  ImageRes._();
  static ImageRes _instance = ImageRes._();
  factory ImageRes() => _instance;

  String image = 'assets/image';
  String logo = 'assets/images/ic_app.png';
  String userDefault =
      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';
}