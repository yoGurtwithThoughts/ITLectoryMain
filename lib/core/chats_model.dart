class Message {
  final int? id;
  final String sender;
  final String content;
  final String? imageUrl;
  final String? filePath;
  final String? audioPath;
  final DateTime timestamp;
  final int? replyTo;

  Message({
    this.id,
    required this.sender,
    required this.content,
    this.imageUrl,
    this.filePath,
    this.audioPath,
    required this.timestamp,
    this.replyTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender,
      'content': content,
      'imageUrl': imageUrl,
      'filePath': filePath,
      'audioPath': audioPath,
      'timestamp': timestamp.toIso8601String(),
      'replyTo': replyTo,
    };
  }

  static Message fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      sender: map['sender'],
      content: map['content'],
      imageUrl: map['imageUrl'],
      filePath: map['filePath'],
      audioPath: map['audioPath'],
      timestamp: DateTime.parse(map['timestamp']),
      replyTo: map['replyTo'],
    );
  }
}
