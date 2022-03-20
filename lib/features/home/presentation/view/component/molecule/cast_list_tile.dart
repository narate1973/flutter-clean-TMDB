import '../../../../../../core/core.dart';

class CastListTile extends StatelessWidget {
  final String imageURL;
  final String name;

  const CastListTile({
    Key? key,
    required this.imageURL,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppNetWorkImage.circle(
        size: 40,
        imageURL: imageURL,
        errorImgPath: 'person-icon.png',
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
