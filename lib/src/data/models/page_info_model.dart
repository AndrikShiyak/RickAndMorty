class PageInfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  PageInfoModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory PageInfoModel.fromJson(Map<String, dynamic> map) {
    return PageInfoModel(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] != null ? map['next'] as String : null,
      prev: map['prev'] != null ? map['prev'] as String : null,
    );
  }
}
