import 'package:flutter/material.dart';
import 'package:ui_doc/core/widgets/shared/app_text_field.dart';
import '../../../core/constants/index.dart';

class AppointmentSearch extends StatefulWidget {
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback? onClearSearch;

  const AppointmentSearch({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    this.onClearSearch,
  });

  @override
  State<AppointmentSearch> createState() => _AppointmentSearchState();
}

class _AppointmentSearchState extends State<AppointmentSearch> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchQuery);
  }

  @override
  void didUpdateWidget(AppointmentSearch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      _controller.text = widget.searchQuery;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hint: AppStrings.searchAppointments,
      controller: _controller,
      onChanged: widget.onSearchChanged,
      prefixIcon: AppIcons.search,
      suffixIcon: widget.searchQuery.isNotEmpty ? AppIcons.close : null,
      onSuffixTap: widget.onClearSearch,
      filled: true,
      fillColor: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSizes.radiusL),
    );
  }
}
