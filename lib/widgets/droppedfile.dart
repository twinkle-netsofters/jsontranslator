class DroppedFile{
  final String name;
  final String mime;
  final String url;
  final int byte;
  final String data;

  DroppedFile({required this.data,required this.name, required this.mime , required this.url, required this.byte});

  String get size{
    final kb = byte / 1024;
    final mb = kb/1024;
    return mb > 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} Kb';

  }
}