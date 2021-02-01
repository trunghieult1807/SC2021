import 'dart:math';

Random random = Random();
List names = [
  "Ling Waldner",
  "Gricelda Barrera",
  "Lenard Milton",
  "Bryant Marley",
  "Rosalva Sadberry",
  "Guadalupe Ratledge",
  "Brandy Gazda",
  "Kurt Toms",
  "Rosario Gathright",
  "Kim Delph",
  "Stacy Christensen",
];

List notifs = [
  "mentioned you in a comment",
  "shared your post",
  "commented on your post",
  "replied to your comment",
  "reacted to your comment",
  "asked you to join a Group️",
  "asked you to like a page",
  "tagged you in a post",
  "sent you a friend request",
];

List notifications = List.generate(
  13,
  (index) => {
    "name": names[random.nextInt(10)],
    "dp": "assets/images/i${random.nextInt(5)}.jpg",
    "time": "${random.nextInt(50)} min ago",
    "notif": notifs[random.nextInt(8)]
  },
);
