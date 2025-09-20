import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/appointment_controller_new.dart';
import '../../core/widgets/index.dart';
import '../../controllers/dashboard_controller.dart';
import '../../widgets/animations.dart';
import '../../screens/dashboard/widgets/bottom_nav.dart';
import 'widgets/index.dart';
import 'functions/appointment_functions.dart';
import '../../core/constants/index.dart';
import 'create_appointment_screen.dart';
import '../../core/widgets/shared/language_switcher.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentController appointmentController =
        Get.find<AppointmentController>();
    final DashboardController dashboardController =
        Get.find<DashboardController>();

    // Update selected index when appointments is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboardController.changeBottomNavIndex(1);
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(AppStrings.appointments),
        centerTitle: false,
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          // Language Switcher
          const Padding(
            padding: EdgeInsets.only(right: AppSizes.space2),
            child: LanguageSwitcherChip(),
          ),

          IconButton(
            icon: const Icon(AppIcons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAppointmentScreen(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: DashboardBottomNav(
        selectedIndex: dashboardController.selectedBottomNavIndex,
        onTap: (i) {
          dashboardController.changeBottomNavIndex(i);
          dashboardController.navigateToScreen(i);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppSizes.paddingM),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingM,
              ),
              child: AppointmentSearch(
                searchQuery: appointmentController.searchQuery,
                onSearchChanged: (value) {
                  appointmentController.searchAppointments(value);
                },
                onClearSearch: () {
                  appointmentController.searchAppointments('');
                },
              ),
            ),

            // Filter Tabs
            AppointmentTabs(
              tabs: appointmentController.filterOptions,
              selectedTab: appointmentController.selectedFilter,
              onTabSelected: (filter) {
                appointmentController.filterAppointments(filter);
              },
            ),

            // Content
            Expanded(
              child: GetX<AppointmentController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return AppAnimations.fadeIn(
                      child: AppLoading(message: AppStrings.loading),
                    );
                  }

                  if (controller.filteredAppointments.isEmpty) {
                    return AppAnimations.fadeIn(
                      child: AppEmptyState(
                        title: AppStrings.noAppointments,
                        description: AppStrings.noAppointmentsDesc,
                        icon: AppIcons.appointments,
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingM,
                      vertical: AppSizes.paddingS,
                    ),
                    itemCount: controller.filteredAppointments.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppSizes.paddingM),
                    itemBuilder: (context, index) {
                      final appointment =
                          controller.filteredAppointments[index];

                      return AppointmentCard(
                        appointment: appointment,
                        onAccept: () => AppointmentFunctions.acceptAppointment(
                          appointment.id,
                        ),
                        onDecline: () =>
                            AppointmentFunctions.declineAppointment(
                              appointment.id,
                            ),
                        onReschedule: () =>
                            AppointmentFunctions.rescheduleAppointment(
                              appointment.id,
                            ),
                        onJoinSession: () =>
                            AppointmentFunctions.joinSession(appointment.id),
                        onViewDetails: () =>
                            AppointmentFunctions.viewAppointmentDetails(
                              appointment.id,
                            ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
