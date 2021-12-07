class Lazymodel1 {
  final String a;
  final String b;
  final String c;
  final String d;
  final String e;
  final String f;
  final String g;
  final String h;
  final String j;
  final String k;
  Lazymodel1(
      {this.a,
      this.b,
      this.c,
      this.d,
      this.e,
      this.f,
      this.g,
      this.h,
      this.j,
      this.k});

  factory Lazymodel1.fromJson(Map<String, dynamic> json) {
    return Lazymodel1(
      a: json['a'] as String,
      b: json['b'] as String,
      c: json['c'] as String,
      d: json['d'] as String,
      e: json['e'] as String,
      f: json['f'] as String,
      g: json['g'] as String,
      h: json['h'] as String,
      j: json['j'] as String,
      k: json['k'] as String,
    );
  }
}

class Lazymodel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  Lazymodel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);
}
