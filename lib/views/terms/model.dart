class TermsData {
  late final TermsModel model;

  TermsData.fromJson(Map<String, dynamic> json) {
    model = TermsModel.fromJson(json['data'] ?? {});
  }
}

class TermsModel {
  late final String terms;

  TermsModel.fromJson(Map<String, dynamic> json) {
    terms = json['terms'] ?? "";
  }
}
