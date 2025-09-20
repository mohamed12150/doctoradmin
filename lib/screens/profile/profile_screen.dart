import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_doc/core/widgets/shared/app_card.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/notification_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../screens/dashboard/widgets/bottom_nav.dart';
import 'widgets/index.dart';
import 'functions/profile_functions.dart';
import '../../core/constants/index.dart';
import '../../core/models/index.dart';
import '../../core/widgets/shared/language_switcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController =
        Get.find<NotificationController>();
    final DashboardController dashboardController =
        Get.find<DashboardController>();

    // Update selected index when profile is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboardController.changeBottomNavIndex(2);
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(AppStrings.profile),
        centerTitle: false,
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          // Language Switcher
          const Padding(
            padding: EdgeInsets.only(right: AppSizes.space2),
            child: LanguageSwitcherChip(),
          ),

          Obx(
            () => Stack(
              children: [
                IconButton(
                  icon: const Icon(AppIcons.notifications),
                  onPressed: () => Get.toNamed('/notifications'),
                ),
                if (notificationController.unreadCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(
                          AppSizes.radiusCircular,
                        ),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${notificationController.unreadCount}',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textOnPrimary,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: GetX<UserController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Profile Header
                if (controller.user != null)
                  ProfileHeader(
                    user: controller.user!,
                    isEditMode: controller.isEditMode,
                    onEditAvatar: () => ProfileFunctions.showEditAvatarDialog(),
                  ),

                const SizedBox(height: AppSizes.paddingL),

                // Profile Content
                Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingM),
                  child: Column(
                    children: [
                      // Personal Information
                      AppCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(
                                    AppSizes.paddingS,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.radiusS,
                                    ),
                                  ),
                                  child: Icon(
                                    AppIcons.user,
                                    color: AppColors.primary,
                                    size: AppSizes.iconM,
                                  ),
                                ),
                                const SizedBox(width: AppSizes.paddingM),
                                Text(
                                  'المعلومات الشخصية',
                                  style: AppTextStyles.h6.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSizes.paddingL),

                            EditableField(
                              label: AppStrings.name,
                              value: controller.user?.name ?? '',
                              isEditable: controller.isEditMode,
                              validator: ProfileFunctions.validateName,
                              onChanged: (value) {
                                if (controller.user != null) {
                                  controller.updateUser(
                                    controller.user!.copyWith(name: value),
                                  );
                                }
                              },
                              icon: AppIcons.user,
                            ),

                            const SizedBox(height: AppSizes.paddingM),

                            EditableField(
                              label: AppStrings.email,
                              value: controller.user?.email ?? '',
                              isEditable: controller.isEditMode,
                              keyboardType: TextInputType.emailAddress,
                              validator: ProfileFunctions.validateEmail,
                              onChanged: (value) {
                                if (controller.user != null) {
                                  controller.updateUser(
                                    controller.user!.copyWith(email: value),
                                  );
                                }
                              },
                              icon: AppIcons.email,
                            ),

                            const SizedBox(height: AppSizes.paddingM),

                            EditableField(
                              label: AppStrings.phone,
                              value: controller.user?.phone ?? '',
                              isEditable: controller.isEditMode,
                              keyboardType: TextInputType.phone,
                              validator: ProfileFunctions.validatePhone,
                              onChanged: (value) {
                                if (controller.user != null) {
                                  controller.updateUser(
                                    controller.user!.copyWith(phone: value),
                                  );
                                }
                              },
                              icon: AppIcons.call,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSizes.paddingM),

                      // Professional Information
                      AppCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(
                                    AppSizes.paddingS,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.radiusS,
                                    ),
                                  ),
                                  child: Icon(
                                    AppIcons.medical,
                                    color: AppColors.secondary,
                                    size: AppSizes.iconM,
                                  ),
                                ),
                                const SizedBox(width: AppSizes.paddingM),
                                Text(
                                  'المعلومات المهنية',
                                  style: AppTextStyles.h6.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSizes.paddingL),

                            EditableField(
                              label: AppStrings.specialization,
                              value: controller.user?.specialization ?? '',
                              isEditable: controller.isEditMode,
                              onTap: () {
                                if (controller.user != null) {
                                  ProfileFunctions.showSpecializationDialog(
                                    controller.user!.specialization,
                                    (specialization) {
                                      controller.updateUser(
                                        controller.user!.copyWith(
                                          specialization: specialization,
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              icon: AppIcons.medical,
                            ),

                            const SizedBox(height: AppSizes.paddingM),

                            EditableField(
                              label: AppStrings.location,
                              value: controller.user?.location ?? '',
                              isEditable: controller.isEditMode,
                              onTap: () {
                                if (controller.user != null) {
                                  ProfileFunctions.showLocationDialog(
                                    controller.user!.location,
                                    (location) {
                                      controller.updateUser(
                                        controller.user!.copyWith(
                                          location: location,
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              icon: AppIcons.location,
                            ),

                            const SizedBox(height: AppSizes.paddingM),

                            EditableField(
                              label: AppStrings.bio,
                              value: controller.user?.bio ?? '',
                              isEditable: controller.isEditMode,
                              maxLines: 3,
                              validator: ProfileFunctions.validateBio,
                              onChanged: (value) {
                                if (controller.user != null) {
                                  controller.updateUser(
                                    controller.user!.copyWith(bio: value),
                                  );
                                }
                              },
                              icon: AppIcons.message,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSizes.paddingM),

                      const SizedBox(height: AppSizes.paddingL),

                      // Actions
                      if (controller.user != null)
                        ProfileActions(
                          isEditMode: controller.isEditMode,
                          onEdit: () => controller.toggleEditMode(),
                          onSave: () {
                            if (controller.user != null &&
                                _validateForm(controller.user!)) {
                              ProfileFunctions.saveProfile(controller.user!);
                              controller.toggleEditMode();
                            }
                          },
                          onCancel: () => controller.toggleEditMode(),
                          onLogout: () => ProfileFunctions.showLogoutDialog(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: DashboardBottomNav(
        selectedIndex: dashboardController.selectedBottomNavIndex,
        onTap: (i) {
          dashboardController.changeBottomNavIndex(i);
          dashboardController.navigateToScreen(i);
        },
      ),
    );
  }

  bool _validateForm(UserModel user) {
    if (ProfileFunctions.validateName(user.name) != null) return false;
    if (ProfileFunctions.validateEmail(user.email) != null) return false;
    if (ProfileFunctions.validatePhone(user.phone) != null) return false;
    if (ProfileFunctions.validateBio(user.bio) != null) return false;
    return true;
  }
}
