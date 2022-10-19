class DataModel {
  int category;
  String subCategory;
  String question;
  String ans;

  DataModel(
      {required this.category,
      required this.subCategory,
      required this.question,
      required this.ans});

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'subcategory': subCategory,
      'que': question,
      'ans': ans
    };
  }

  static DataModel fromMap(obj) {
    return DataModel(
        category: obj['category'],
        subCategory: obj['subcategory'],
        question: obj['que'],
        ans: obj['ans']);
  }
}
