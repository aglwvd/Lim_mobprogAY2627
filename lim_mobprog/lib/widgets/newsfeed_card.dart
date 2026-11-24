
import 'package:flutter/material.dart';
import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final int numOfLikes;
  final String date;
  final bool hasImage;
  final String? imagePath;
  final String? profileImage;

 const NewsFeedCard({
  super.key,
  required this.userName,
  required this.postContent,
  required this.numOfLikes,
  required this.date,
  this.hasImage = false,
  this.imagePath,
  this.profileImage,
});

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  bool isLiked = false;
  late int likes;
  final TextEditingController commentController =
      TextEditingController();

  final List<String> comments = [];

  @override
  void initState() {
    super.initState();
    likes = widget.numOfLikes;
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  void addComment() {
    final comment = commentController.text.trim();

    if (comment.isNotEmpty) {
      setState(() {
        comments.add(comment);
        commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
  radius: 22,
  backgroundColor: Colors.grey.shade300,
  backgroundImage: widget.profileImage != null
      ? AssetImage(widget.profileImage!)
      : null,
  child: widget.profileImage == null
      ? Text(
          widget.userName[0].toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      : null,
),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.userName,
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Text(
                      widget.date,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),

            const SizedBox(height: 12),

            Text(widget.postContent),

            const SizedBox(height: 10),

            // Enhancement 1: Optional post image
            if (widget.hasImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: widget.imagePath != null
                    ? Image.asset(
                        widget.imagePath!,
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 220,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        child: const Icon(
                          Icons.image,
                          size: 70,
                          color: Colors.grey,
                        ),
                      ),
              ),

            const SizedBox(height: 12),

            Text('$likes Likes'),

            const Divider(),

            // Enhancement 3: Widget-based buttons
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: toggleLike,
                  icon: Icon(
                    isLiked
                        ? Icons.thumb_up
                        : Icons.thumb_up_outlined,
                    color: isLiked
                        ? FB_PRIMARY
                        : Colors.grey,
                  ),
                  label: Text(
                    'Like',
                    style: TextStyle(
                      color: isLiked
                          ? FB_PRIMARY
                          : Colors.grey,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(
                      FocusNode(),
                    );
                  },
                  icon: const Icon(
                    Icons.comment_outlined,
                  ),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Share button clicked!',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.share_outlined),
                  label: const Text('Share'),
                ),
              ],
            ),

            const Divider(),

            Row(
              children: [
                const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(
                  'assets/images/aljohn.jpg',
                ),
              ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: commentController,
                    onSubmitted: (_) => addComment(),
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: addComment,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            for (final comment in comments)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('• $comment'),
              ),
          ],
        ),
      ),
    );
  }
}
