class TimeHelper{
  static String timeAgo(String created) {
    final createdTime = DateTime.parse(created);
    final now = DateTime.now().subtract(const Duration(hours: 5));
    final diff = now.difference(createdTime);

    if (diff.inSeconds < 60) {
      return '${diff.inSeconds} seconds ago';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} mins ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hours ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} days ago';
    } else {
      return '${(diff.inDays / 7).floor()} weeks ago';
    }
  }

}