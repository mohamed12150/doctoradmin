import 'package:flutter/material.dart';

class DashboardBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTap;
  const DashboardBottomNav({super.key, this.selectedIndex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFFF8A00)),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: _BottomItem(
                label: 'Dashboard',
                icon: Icons.grid_view_rounded,
                selected: selectedIndex == 0,
                onTap: () => onTap?.call(0),
              ),
            ),
            Expanded(
              child: _BottomItem(
                label: 'Appointments',
                icon: Icons.receipt_long_outlined,
                selected: selectedIndex == 1,
                onTap: () => onTap?.call(1),
              ),
            ),
            Expanded(
              child: _BottomItem(
                label: 'Profile',
                icon: Icons.person_outline,
                selected: selectedIndex == 2,
                onTap: () => onTap?.call(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;
  const _BottomItem({
    required this.label,
    required this.icon,
    this.selected = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFA63A) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            if (label.isNotEmpty) ...[
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
