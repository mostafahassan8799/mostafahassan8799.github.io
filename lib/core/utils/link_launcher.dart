import 'package:url_launcher/url_launcher.dart';

/// Opens absolute URLs (https, mailto) and paths relative to the site root
/// (e.g. the CV PDF served next to index.html).
Future<void> openLink(String url) async {
  final uri = Uri.base.resolve(url);
  await launchUrl(uri, webOnlyWindowName: '_blank');
}
