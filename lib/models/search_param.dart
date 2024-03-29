class SearchParam {
  int? type;
  String? keyword;
  int page = 1;

  SearchParam(this.keyword, this.type, this.page);

  nextPage() {
    page = page + 1;
  }

  search(String searchKey) {
    keyword = searchKey;
    page = 1;
    type = null;
  }

  setType(int t) {
    type = t;
    keyword = null;
    page = 1;
  }
}
