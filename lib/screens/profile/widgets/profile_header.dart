import 'package:flutter/material.dart';
import '../../../core/models/index.dart';
import '../../../core/constants/index.dart';
import '../../../widgets/image_placeholder.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onEditAvatar;
  final bool isEditMode;

  const ProfileHeader({
    super.key,
    required this.user,
    this.onEditAvatar,
    this.isEditMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.space4),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        boxShadow: AppColors.cardShadowHover,
      ),
      child: Stack(
        children: [
          // Background Pattern
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textOnPrimary.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textOnPrimary.withOpacity(0.05),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(AppSizes.space8),
            child: Column(
              children: [
                const SizedBox(height: AppSizes.space4),

                // Avatar Section
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.textOnPrimary.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: AppSizes.avatarHuge / 2,
                        backgroundColor: AppColors.surfaceContainer,
                        child: ImagePlaceholder(
                          imagePath: user.avatar,
                          width: AppSizes.avatarHuge,
                          height: AppSizes.avatarHuge,
                        ),
                      ),
                    ),
                    if (isEditMode)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: onEditAvatar,
                          child: Container(
                            padding: const EdgeInsets.all(AppSizes.space2),
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.surfaceContainer,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.accent.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              AppIcons.edit,
                              color: AppColors.textOnPrimary,
                              size: AppSizes.iconS,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: AppSizes.space6),

                // User Info
                Text(
                  user.name,
                  style: AppTextStyles.displaySmall.copyWith(
                    color: AppColors.textOnPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppSizes.space2),

                Text(
                  user.specialization,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.textOnPrimary.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppSizes.space4),

                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem(
                      icon: AppIcons.clock,
                      label: 'الخبرة',
                      value: '${user.experience} سنة',
                    ),
                    _buildStatItem(
                      icon: AppIcons.user,
                      label: 'المرضى',
                      value: '150+',
                    ),
                    _buildStatItem(
                      icon: AppIcons.success,
                      label: 'التقييم',
                      value: '4.8',
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.space6),

                // Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.space6,
                    vertical: AppSizes.space2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                    border: Border.all(
                      color: AppColors.success.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: AppSizes.space2),
                      Text(
                        'متاح للاستشارات',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.space4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSizes.space3),
          decoration: BoxDecoration(
            color: AppColors.textOnPrimary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
          ),
          child: Icon(
            icon,
            color: AppColors.textOnPrimary,
            size: AppSizes.iconM,
          ),
        ),
        const SizedBox(height: AppSizes.space2),
        Text(
          value,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.textOnPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textOnPrimary.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
