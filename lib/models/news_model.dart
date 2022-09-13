class NewsModel {
  //String? id;
  String? title;
  String? detail;
  String? images;
  String? newsDateTime;

  NewsModel({ //this.id ,
  this.title, this.detail, this.images, this.newsDateTime});

  NewsModel.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    title = json['title'];
    detail = json['detail'];
    images = json['images'];
    newsDateTime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['id'] = this.id;
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['images'] = this.images;
    data['datetime'] = this.newsDateTime;
    return data;
  }
}
