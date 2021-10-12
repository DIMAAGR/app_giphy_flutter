class GifProperty {
  final String gifUrl; // .gif image url
  final String hdMp4Url; // .mp4 hd video url
  final String p480Mp4Url; // .mp4 480p video url
  final String title; // gif title
  final String username;

  GifProperty(
      {required this.gifUrl,
      required this.hdMp4Url,
      required this.p480Mp4Url,
      required this.title,
      required this.username});
}
