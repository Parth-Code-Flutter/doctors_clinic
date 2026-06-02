class ReportTrendItem {
  const ReportTrendItem({
    required this.label,
    required this.visits,
    required this.revenue,
    required this.noShows,
  });

  final String label;
  final int visits;
  final int revenue;
  final int noShows;
}
