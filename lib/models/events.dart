class Events {
  String date; // Non-nullable
  String image;
  String venue;
  String des;
  String title;
  String form;

  Events({
    this.date = '',   // Provide default values
    this.image = '',
    this.venue = '',
    this.des = '',
    this.title = '',
    this.form='',
  });

  Events.fromJson(Map<String, dynamic> json)
      : date = json["Date"] ?? '', // Use null-aware operators
        image = json["Image"] ?? '',
        venue = json["Venue"] ?? '',
        des = json["Description"] ?? '',
        title = json["title"] ?? '',
        form = json["form"] ?? '';


  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "image": image,
      "venue": venue,
      "des": des,
      "title": title,
      "form":form,
    };
  }
}
