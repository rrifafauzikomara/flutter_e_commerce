class ApiResponse<T> {
  ApiResponse({
    this.status,
    this.code,
    this.message,
    this.data,
    required this.onSerialized,
    required this.onDeserialized,
  });

  bool? status;
  int? code;
  String? message;
  T? data;
  late dynamic Function(T) onSerialized;
  late T Function(dynamic) onDeserialized;

  ApiResponse.fromJson(
    Map<String, dynamic> json, {
    required dynamic Function(T) onDataSerialized,
    required T Function(dynamic) onDataDeserialized,
  }) {
    onSerialized = onDataSerialized;
    onDeserialized = onDataDeserialized;
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? onDeserialized(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data != null ? onSerialized(data as T) : null,
      };
}
