class LogDataOrdinary {
  final String? type;
  final int? status;

  const LogDataOrdinary({required this.type, required this.status});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': type,
      'status': status,
    };
  }

  factory LogDataOrdinary.fromJson(Map<String, dynamic> map) {
    return LogDataOrdinary(
      type: map['type'] != null ? map['type'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  @override
  String toString() {
    return 'Fazendo no dart Puro: Status: $status, Type: $type';
  }
}
