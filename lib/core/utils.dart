import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:twitter_w/theme/pallete.dart';

void showSnakebar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Pallete.redDeepColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 90,
        child: Row(
          children: [
            const SizedBox(width: 48,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(IconlyBold.chat),
                      Text(
                        " 发生问题了",
                        style: TextStyle(
                          color: Pallete.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    content,
                    style: const TextStyle(
                      color: Pallete.whiteColor,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
