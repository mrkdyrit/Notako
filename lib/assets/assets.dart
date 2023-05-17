class Assets {
  // Images
  static const String imagePath = "lib/assets/images/";

  // Logo
  static const String logoPath = "logo/";

  // Logo Images
  static const String logoSVGPath = "$imagePath${logoPath}svg/";

  static const String svgLogoOnly = "${logoSVGPath}notako_logo_transparent.svg";
  static const String svgLogoHorizontal = "${logoSVGPath}notako_logo_horizontal.svg";
  static const String svgLogoVertical = "${logoSVGPath}notako_logo_vertical.svg";

  static const String logoPNGPath = "$imagePath${logoPath}png/";

  static const String pngLogoOnly = "${logoPNGPath}notako_logo_only.png";

  // Help images
  static const String helpImagesPath = "${imagePath}help/";

  static const String helpSampleImageAttachment = "${helpImagesPath}help_sample_image_attachment.png";
  static const String helpEmptyNoteIndicator = "${helpImagesPath}help_empty_note_indicator.png";

  // No Note Indicator
  static const String noNoteIndicator = "${imagePath}empty_note_indictor.png";

  static const String noTrashIndicator = "${imagePath}empty_trash_indictor.png";
}