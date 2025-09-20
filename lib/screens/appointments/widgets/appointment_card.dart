import 'package:flutter/material.dart';
import 'package:ui_doc/core/widgets/shared/app_button.dart';
import 'package:ui_doc/core/widgets/shared/app_card.dart';
import '../../../models/appointment_model.dart';
import '../../../core/constants/index.dart';
import '../../../widgets/image_placeholder.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onReschedule;
  final VoidCallback? onJoinSession;
  final VoidCallback? onViewDetails;

  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onAccept,
    this.onDecline,
    this.onReschedule,
    this.onJoinSession,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: AppSizes.paddingM),
          _buildPatientInfo(),
          const SizedBox(height: AppSizes.paddingM),
          _buildAppointmentDetails(),
          const SizedBox(height: AppSizes.paddingM),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [_buildStatusChip(), const Spacer(), _buildTimeInfo()],
    );
  }

  Widget _buildStatusChip() {
    final statusColor = _getStatusColor();
    final statusText = _getStatusText();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingS,
        vertical: AppSizes.paddingXS,
      ),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusS),
        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        statusText,
        style: AppTextStyles.caption.copyWith(
          color: statusColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          appointment.time,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          appointment.appointmentDate,
          style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildPatientInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: AppSizes.avatarS / 2,
          child: ImagePlaceholder(
            imagePath: appointment.patientAvatar,
            width: AppSizes.avatarS,
            height: AppSizes.avatarS,
          ),
        ),
        const SizedBox(width: AppSizes.paddingM),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.patientName,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSizes.paddingXS),
              Text(
                appointment.condition,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSizes.paddingXS),
              Text(
                appointment.visitType,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
          icon: AppIcons.time,
          label: AppStrings.appointmentDate,
          value: appointment.date,
        ),
        if (appointment.notes != null && appointment.notes!.isNotEmpty) ...[
          const SizedBox(height: AppSizes.paddingS),
          _buildDetailRow(
            icon: AppIcons.message,
            label: AppStrings.appointmentNotes,
            value: appointment.notes!,
          ),
        ],
      ],
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: AppSizes.iconS, color: AppColors.textSecondary),
        const SizedBox(width: AppSizes.paddingS),
        Text(
          '$label: ',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (appointment.status == AppointmentStatus.pending) ...[
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: AppStrings.accept,
                  onPressed: onAccept,
                  type: AppButtonType.primary,
                  size: AppButtonSize.small,
                ),
              ),
              const SizedBox(width: AppSizes.paddingS),
              Expanded(
                child: AppButton(
                  text: AppStrings.decline,
                  onPressed: onDecline,
                  type: AppButtonType.outline,
                  size: AppButtonSize.small,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.paddingS),
        ] else if (appointment.status == AppointmentStatus.upcoming) ...[
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: AppStrings.joinSession,
                  onPressed: onJoinSession,
                  type: AppButtonType.primary,
                  size: AppButtonSize.small,
                ),
              ),
              const SizedBox(width: AppSizes.paddingS),
              Expanded(
                child: AppButton(
                  text: AppStrings.reschedule,
                  onPressed: onReschedule,
                  type: AppButtonType.outline,
                  size: AppButtonSize.small,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.paddingS),
        ],
        AppButton(
          text: AppStrings.viewDetails,
          onPressed: onViewDetails,
          type: AppButtonType.text,
          size: AppButtonSize.small,
        ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (appointment.status) {
      case AppointmentStatus.pending:
        return AppColors.warning;
      case AppointmentStatus.upcoming:
        return AppColors.success;
      case AppointmentStatus.completed:
        return AppColors.info;
      case AppointmentStatus.cancelled:
        return AppColors.error;
    }
  }

  String _getStatusText() {
    switch (appointment.status) {
      case AppointmentStatus.pending:
        return AppStrings.pending;
      case AppointmentStatus.upcoming:
        return AppStrings.upcomingAppointments;
      case AppointmentStatus.completed:
        return AppStrings.completed;
      case AppointmentStatus.cancelled:
        return AppStrings.cancelled;
    }
  }
}
