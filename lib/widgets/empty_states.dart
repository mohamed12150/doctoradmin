import 'package:flutter/material.dart';

class EmptyStates {
  // Generic empty state
  static Widget emptyState({
    required IconData icon,
    required String title,
    required String subtitle,
    String? buttonText,
    VoidCallback? onButtonPressed,
    Color? iconColor,
    double iconSize = 64.0,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? Colors.grey[400],
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2A1759),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A1759),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // No appointments empty state
  static Widget noAppointments({
    VoidCallback? onAddAppointment,
  }) {
    return emptyState(
      icon: Icons.calendar_today_outlined,
      title: 'No Appointments',
      subtitle: 'You don\'t have any appointments yet.\nSchedule your first appointment to get started.',
      buttonText: 'Schedule Appointment',
      onButtonPressed: onAddAppointment,
      iconColor: const Color(0xFFFF8A00),
    );
  }

  // No notifications empty state
  static Widget noNotifications() {
    return emptyState(
      icon: Icons.notifications_none,
      title: 'No Notifications',
      subtitle: 'You\'re all caught up!\nNew notifications will appear here when they arrive.',
      iconColor: const Color(0xFF2A1759),
    );
  }

  // No search results empty state
  static Widget noSearchResults({
    required String searchQuery,
    VoidCallback? onClearSearch,
  }) {
    return emptyState(
      icon: Icons.search_off,
      title: 'No Results Found',
      subtitle: 'We couldn\'t find any results for "$searchQuery".\nTry adjusting your search terms.',
      buttonText: 'Clear Search',
      onButtonPressed: onClearSearch,
      iconColor: Colors.grey[400],
    );
  }

  // No data empty state
  static Widget noData({
    required String title,
    required String subtitle,
    IconData? icon,
  }) {
    return emptyState(
      icon: icon ?? Icons.inbox_outlined,
      title: title,
      subtitle: subtitle,
      iconColor: Colors.grey[400],
    );
  }

  // Error empty state
  static Widget errorState({
    required String title,
    required String subtitle,
    VoidCallback? onRetry,
  }) {
    return emptyState(
      icon: Icons.error_outline,
      title: title,
      subtitle: subtitle,
      buttonText: 'Try Again',
      onButtonPressed: onRetry,
      iconColor: Colors.red[400],
    );
  }

  // Network error empty state
  static Widget networkError({
    VoidCallback? onRetry,
  }) {
    return emptyState(
      icon: Icons.wifi_off,
      title: 'No Internet Connection',
      subtitle: 'Please check your internet connection and try again.',
      buttonText: 'Retry',
      onButtonPressed: onRetry,
      iconColor: Colors.orange[400],
    );
  }

  // Loading error empty state
  static Widget loadingError({
    VoidCallback? onRetry,
  }) {
    return emptyState(
      icon: Icons.refresh,
      title: 'Something Went Wrong',
      subtitle: 'We encountered an error while loading your data.\nPlease try again.',
      buttonText: 'Retry',
      onButtonPressed: onRetry,
      iconColor: Colors.red[400],
    );
  }

  // Custom empty state with animation
  static Widget animatedEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
    String? buttonText,
    VoidCallback? onButtonPressed,
    Color? iconColor,
  }) {
    return _AnimatedEmptyState(
      icon: icon,
      title: title,
      subtitle: subtitle,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      iconColor: iconColor,
    );
  }
}

class _AnimatedEmptyState extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Color? iconColor;

  const _AnimatedEmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onButtonPressed,
    this.iconColor,
  });

  @override
  State<_AnimatedEmptyState> createState() => _AnimatedEmptyStateState();
}

class _AnimatedEmptyStateState extends State<_AnimatedEmptyState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: EmptyStates.emptyState(
              icon: widget.icon,
              title: widget.title,
              subtitle: widget.subtitle,
              buttonText: widget.buttonText,
              onButtonPressed: widget.onButtonPressed,
              iconColor: widget.iconColor,
            ),
          ),
        );
      },
    );
  }
}
