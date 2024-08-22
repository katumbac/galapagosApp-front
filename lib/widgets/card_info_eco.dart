import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';

class CardInfoEco extends StatelessWidget {
  final Size size;
  final Map<String, dynamic> eco;
  final VoidCallback onTap;

  const CardInfoEco({
    super.key,
    required this.size,
    required this.eco,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        width: size.width * 0.5,
        height: size.height * 0.12,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      eco['imagen'],
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            eco['nombre'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.03,
                              color: colorbuttonGreen,
                            ),
                            overflow: TextOverflow.visible,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Icon(
                    Icons.chevron_right_outlined,
                    color: colorbuttonGreen,
                    size: size.width * 0.05,
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
