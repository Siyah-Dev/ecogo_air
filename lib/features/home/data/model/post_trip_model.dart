class PostTripModel {
  final String from;
  final String to;
  final String onwardDate;
  final String returnDate;
  final String tui;

  const PostTripModel({
    required this.from,
    required this.to,
    required this.onwardDate,
    this.returnDate = '',
    this.tui = '',
  });

  Map<String, dynamic> toJson() {
    return {
      "From": from,
      "To": to,
      "OnwardDate": onwardDate,
      "ReturnDate": returnDate,
      "TUI": tui,
    };
  }
}
