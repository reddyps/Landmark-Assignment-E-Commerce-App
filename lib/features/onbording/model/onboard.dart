class Onboard {
   String image, title, description;
   String? imageDarkTheme;

   Onboard({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}