import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';

class CardInfoIsla extends StatelessWidget {
  final Size size;
  final Map<String, dynamic> isla;
  final int displayStars;
  final VoidCallback onTap;

  const CardInfoIsla({
    super.key,
    required this.size,
    required this.isla,
    required this.displayStars,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        width: size.width * 0.5,
        height: size.height * 0.12,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                isla['imagen'],
                width: size.width * 0.25,
                height: size.height * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              isla['nombre'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
                color: colorbuttonGreen,
              ),
            ),
            subtitle: Row(
              children: [
                ...List.generate(
                  3,
                  (starIndex) => Icon(
                    Icons.star,
                    color: starIndex < displayStars ? gyellow : Colors.grey,
                    size: size.width * 0.05,
                  ),
                ),
                const Spacer(),
                const Expanded(
                  child: Text(
                    'ver más...',
                    style: TextStyle(color: colorbuttonGreen),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
