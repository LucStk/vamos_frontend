enum NetworkOverlayType {
  cycling(
    urlTemplate: 'https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png',
  ),
  hiking(
    urlTemplate: 'https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png',
  ),
  rail(
    urlTemplate: 'https://a.tiles.openrailwaymap.org/standard/{z}/{x}/{y}.png',
  );

  final String urlTemplate;
  const NetworkOverlayType({required this.urlTemplate});
}
