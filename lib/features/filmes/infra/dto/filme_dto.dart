class FilmeDto {
  FilmeDto({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
  });

  String? title;
  int? episodeId;
  String? openingCrawl;
  String? director;
  String? producer;
  String? releaseDate;


  factory FilmeDto.fromMap(Map<String, dynamic> map) {
    return FilmeDto(title: map["title"],
      episodeId: map["episodeId"],
      openingCrawl: map["openingCrawl"],
      director: map["director"],
      producer: map["producer"],
      releaseDate: map["releaseDate"],);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "episodeId": episodeId,
      "openingCrawl": openingCrawl,
      "director": director,
      "producer": producer,
      "releaseDate": releaseDate,
    };
  }
}
