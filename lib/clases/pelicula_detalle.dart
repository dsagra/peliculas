class PeliculaDetalle {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String language;
  final String backdropPath;
  final String originalTitle;
  final int runTime;
  final double voteAverage;

  PeliculaDetalle({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.language,
    this.backdropPath,
    this.originalTitle,
    this.runTime,
    this.voteAverage,
  });

  factory PeliculaDetalle.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['original_title'];
    final overview = json['overview'];
    final posterPath = json['poster_path'];
    final releaseDate = json['release_date'];
    final language = json['original_language'];
    final backdropPath = json['backdrop_path'];
    final originalTitle = json['original_title'];
    final runTime = json['runtime'];
    final voteAverage = json['vote_average'];

    return PeliculaDetalle(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      releaseDate: releaseDate,
      language: language,
      backdropPath: backdropPath,
      originalTitle: originalTitle,
      runTime: runTime,
      voteAverage: voteAverage,
    );
  }
}
