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
      episodeId: map["episode_id"],
      openingCrawl: map["opening_crawl"],
      director: map["director"],
      producer: map["producer"],
      releaseDate: map["release_date"],);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "episode_id": episodeId,
      "opening_crawl": openingCrawl,
      "director": director,
      "producer": producer,
      "release_date": releaseDate,
    };
  }
}
