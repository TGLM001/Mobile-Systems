class Film {
  String title = "";
  int liked = 0;

  Film(this.title, this.liked);

  changeliked(liked) {
    this.liked = liked;
  }
}
