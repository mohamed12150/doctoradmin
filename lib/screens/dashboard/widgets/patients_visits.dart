import 'package:flutter/material.dart';

class PatientsVisitsSection extends StatelessWidget {
  const PatientsVisitsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Patients Visits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        SizedBox(height: 4),
        _DateRangeAndNav(),
        SizedBox(height: 12),
        _MiniBarChart(values: [60, 35, 20, 80, 50]),
      ],
    );
  }
}

class _DateRangeAndNav extends StatelessWidget {
  const _DateRangeAndNav();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('24 OCT - 30 OCT', style: Theme.of(context).textTheme.bodySmall),
        const Spacer(),
        _NavChip(icon: Icons.chevron_left, onTap: () {}),
        const SizedBox(width: 8),
        _NavChip(icon: Icons.chevron_right, onTap: () {}),
      ],
    );
  }
}

class _MiniBarChart extends StatelessWidget {
  final List<int> values;
  const _MiniBarChart({required this.values});
  @override
  Widget build(BuildContext context) {
    final max = (values.isEmpty ? 1 : values.reduce((a, b) => a > b ? a : b)).toDouble();
    return SizedBox(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < values.length; i++)
            _Bar(value: values[i].toDouble(), max: max, highlight: i == 1),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double value;
  final double max;
  final bool highlight;
  const _Bar({required this.value, required this.max, this.highlight = false});
  @override
  Widget build(BuildContext context) {
    final height = (value / (max == 0 ? 1 : max)) * 120;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (highlight)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF2A1759),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(value.toInt().toString(), style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
        const SizedBox(height: 6),
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: highlight ? const Color(0xFFFF8A00) : const Color(0xFFFFC27A),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }
}

class _NavChip extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _NavChip({required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xFFF3E4D1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: const Color(0xFF7A5A3A)),
      ),
    );
  }
}


