import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_doc/screens/dashboard/widgets/header.dart';
import 'package:ui_doc/screens/dashboard/widgets/upcoming_card.dart';
import 'package:ui_doc/screens/dashboard/widgets/pending_card.dart';
import 'package:ui_doc/screens/dashboard/widgets/patients_visits.dart';
import 'package:ui_doc/screens/dashboard/widgets/bottom_nav.dart';
import 'package:ui_doc/screens/dashboard/widgets/availability_scheduling_card.dart';
import 'package:ui_doc/screens/dashboard/widgets/quick_stats_row.dart';
import 'package:ui_doc/controllers/dashboard_controller.dart';
import '../core/widgets/animations.dart';
import '../core/widgets/responsive/responsive_builder.dart';
import '../core/constants/index.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find<DashboardController>();

    // Update selected index when dashboard is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.changeBottomNavIndex(0);
    });

    return ResponsiveBuilder(
      mobile: _buildMobileLayout(context, controller),
      tablet: _buildTabletLayout(context, controller),
      desktop: _buildDesktopLayout(context, controller),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    DashboardController controller,
  ) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            const SizedBox(height: AppSizes.space3),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.radiusXL),
                    topRight: Radius.circular(AppSizes.radiusXL),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSizes.space4,
                    AppSizes.space5,
                    AppSizes.space4,
                    AppSizes.space20,
                  ),
                  child: ResponsiveColumn(
                    children: [
                      AppAnimations.fadeInUp(
                        duration: const Duration(milliseconds: 300),
                        child: const UpcomingAppointmentCard(),
                      ),
                      AppAnimations.fadeInUp(
                        duration: const Duration(milliseconds: 400),
                        child: const AvailabilitySchedulingCard(),
                      ),
                      AppAnimations.fadeInUp(
                        duration: const Duration(milliseconds: 500),
                        child: const QuickStatsRow(),
                      ),
                      AppAnimations.fadeInUp(
                        duration: const Duration(milliseconds: 600),
                        child: const PendingAppointmentCard(),
                      ),
                      AppAnimations.fadeInUp(
                        duration: const Duration(milliseconds: 700),
                        child: const PatientsVisitsSection(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DashboardBottomNav(
        selectedIndex: controller.selectedBottomNavIndex,
        onTap: (i) {
          controller.changeBottomNavIndex(i);
          controller.navigateToScreen(i);
        },
      ),
    );
  }

  Widget _buildTabletLayout(
    BuildContext context,
    DashboardController controller,
  ) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Row(
          children: [
            // Sidebar
            Container(
              width: 280,
              decoration: const BoxDecoration(
                color: AppColors.surfaceContainer,
                border: Border(right: BorderSide(color: AppColors.borderLight)),
              ),
              child: Column(
                children: [
                  const DashboardHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(AppSizes.space4),
                      child: ResponsiveColumn(
                        children: [
                          AppAnimations.fadeInLeft(
                            duration: const Duration(milliseconds: 300),
                            child: const UpcomingAppointmentCard(),
                          ),
                          AppAnimations.fadeInLeft(
                            duration: const Duration(milliseconds: 400),
                            child: const AvailabilitySchedulingCard(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.space6),
                child: ResponsiveColumn(
                  children: [
                    AppAnimations.fadeInUp(
                      duration: const Duration(milliseconds: 500),
                      child: const QuickStatsRow(),
                    ),
                    AppAnimations.fadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: const PendingAppointmentCard(),
                    ),
                    AppAnimations.fadeInUp(
                      duration: const Duration(milliseconds: 700),
                      child: const PatientsVisitsSection(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    DashboardController controller,
  ) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Row(
          children: [
            // Sidebar
            Container(
              width: 320,
              decoration: const BoxDecoration(
                color: AppColors.surfaceContainer,
                border: Border(right: BorderSide(color: AppColors.borderLight)),
              ),
              child: Column(
                children: [
                  const DashboardHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(AppSizes.space6),
                      child: ResponsiveColumn(
                        children: [
                          AppAnimations.fadeInLeft(
                            duration: const Duration(milliseconds: 300),
                            child: const UpcomingAppointmentCard(),
                          ),
                          AppAnimations.fadeInLeft(
                            duration: const Duration(milliseconds: 400),
                            child: const AvailabilitySchedulingCard(),
                          ),
                          AppAnimations.fadeInLeft(
                            duration: const Duration(milliseconds: 500),
                            child: const QuickStatsRow(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.space8),
                child: ResponsiveGrid(
                  children: [
                    AppAnimations.fadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: const PendingAppointmentCard(),
                    ),
                    AppAnimations.fadeInUp(
                      duration: const Duration(milliseconds: 700),
                      child: const PatientsVisitsSection(),
                    ),
                  ],
                  mobileColumns: 1,
                  tabletColumns: 2,
                  desktopColumns: 2,
                  largeDesktopColumns: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
