class BaseResponse<T> {
  String message;
  bool error;
  int code;
  T? details;

  BaseResponse({required this.code,
    required this.details,
    required this.error,
    required this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json, {T? details}) {
    return BaseResponse(
      code: json['code'],
      details: details,
      error: json['error'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson(T? details) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.details != null) {
      data['details'] = details;
    }
    return data;
  }
}
