
import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Aljohn Lim',
           profileImage: 'assets/images/aljohn.jpg',
          postContent: 'Lola ko patay na, Di naging paro paro',
          numOfLikes: 100,
          date: 'October 11',
        ),
        NewsFeedCard(
          userName: 'Gian Lawrence Manzo',
           profileImage: 'assets/images/gian.jpg',
          postContent:
              'Mahal ako ng tito ko.',
          numOfLikes: 200,
          hasImage: true,
          imagePath: 'assets/images/titob.jpg',
          date: 'December 2',
        
        ),
      ],
    );
  }
}