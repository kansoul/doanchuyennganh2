class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;
  final bool isSeen;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.time,
    required this.isActive,
    required this.isSeen,
  });
}

List chatsData = [
  Chat(
    name: "Thằng hàng xóm",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isSeen: true,
    isActive: false,
  ),
  Chat(
    name: "Huy Nguyễn",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isSeen: true,
    isActive: true,
  ),
  Chat(
    name: "Đức Cụi Aaaa",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isSeen: false,
    isActive: false,
  ),
  Chat(
    name: "Lâm Rừng Ber",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isSeen: true,
    isActive: true,
  ),
  Chat(
    name: "Sơn núi Cer",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isSeen: false,
    isActive: false,
  ),
  Chat(
    name: "Đoan 9 ngón",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isSeen: false,
    isActive: false,
  ),
  Chat(
    name: "Hưng Ruồi D",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isSeen: true,
    isActive: false,
  ),
  Chat(
    name: "Khánh Xẹo D",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isSeen: true,
    isActive: false,
  ),
  Chat(
    name: "Bé hàng xóm",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isSeen: true,
    isActive: false,
  ),
  Chat(
    name: "Best Friend",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isSeen: true,
    isActive: false,
  ),
];
