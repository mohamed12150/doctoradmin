import 'package:flutter/material.dart';
import '../core/constants/index.dart';
import '../core/widgets/index.dart';

class ClinicalAddressScreen extends StatefulWidget {
  const ClinicalAddressScreen({super.key});

  @override
  State<ClinicalAddressScreen> createState() => _ClinicalAddressScreenState();
}

class _ClinicalAddressScreenState extends State<ClinicalAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _clinicNameController = TextEditingController();
  final _roleController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  String? _selectedRole;

  final List<String> _roles = [
    'طبيب استشاري',
    'طبيب أخصائي',
    'طبيب عام',
    'طبيب مقيم',
    'طبيب متدرب',
    'أخرى',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('العنوان السريري'),
        centerTitle: false,
        backgroundColor: AppColors.surfaceContainer,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(AppIcons.back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          TextButton(
            onPressed: _skip,
            child: Text(
              'تخطي',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppSizes.space4),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          boxShadow: AppColors.cardShadow,
        ),
        child: SafeArea(
          child: AppButton(
            text: 'إرسال KYC',
            onPressed: _submitKYC,
            type: AppButtonType.primary,
            size: AppButtonSize.large,
            isFullWidth: true,
            icon: AppIcons.check,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.space4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),

              const SizedBox(height: AppSizes.space6),

              // Form Fields
              _buildFormFields(),

              const SizedBox(height: AppSizes.space8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.space6),
      decoration: BoxDecoration(
        gradient: AppColors.secondaryGradient,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.space3),
            decoration: BoxDecoration(
              color: AppColors.textOnPrimary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
            ),
            child: const Icon(
              AppIcons.location,
              color: AppColors.textOnPrimary,
              size: AppSizes.iconL,
            ),
          ),
          const SizedBox(width: AppSizes.space4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'العنوان السريري',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.textOnPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSizes.space1),
                Text(
                  'أدخل معلومات عيادتك أو مكان عملك',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textOnPrimary.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        AppTextField(
          controller: _clinicNameController,
          label: 'اسم العيادة/المستشفى',
          hint: 'أدخل اسم العيادة أو المستشفى',
          prefixIcon: AppIcons.hospital,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال اسم العيادة';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        GestureDetector(
          onTap: _selectRole,
          child: Container(
            padding: const EdgeInsets.all(AppSizes.space4),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Icon(
                  AppIcons.user,
                  color: AppColors.primary,
                  size: AppSizes.iconM,
                ),
                const SizedBox(width: AppSizes.space3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'دورك المهني',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        _selectedRole ?? 'اختر دورك المهني',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: _selectedRole != null
                              ? AppColors.textPrimary
                              : AppColors.textHint,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  AppIcons.down,
                  color: AppColors.textSecondary,
                  size: AppSizes.iconS,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: AppSizes.space4),

        AppTextField(
          controller: _addressController,
          label: 'عنوان العيادة',
          hint: 'أدخل العنوان الكامل للعيادة',
          maxLines: 3,
          prefixIcon: AppIcons.location,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال عنوان العيادة';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        AppTextField(
          controller: _phoneController,
          label: 'رقم هاتف العيادة',
          hint: 'أدخل رقم هاتف العيادة',
          keyboardType: TextInputType.phone,
          prefixIcon: AppIcons.call,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال رقم هاتف العيادة';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        AppTextField(
          controller: _emailController,
          label: 'البريد الإلكتروني للعيادة',
          hint: 'أدخل البريد الإلكتروني للعيادة',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: AppIcons.email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال البريد الإلكتروني';
            }
            if (!value.contains('@')) {
              return 'يرجى إدخال بريد إلكتروني صحيح';
            }
            return null;
          },
        ),
      ],
    );
  }

  void _selectRole() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusL),
        ),
      ),
      builder: (context) => Container(
        height: 400,
        padding: const EdgeInsets.all(AppSizes.space4),
        child: Column(
          children: [
            Text(
              'اختر دورك المهني',
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSizes.space4),
            Expanded(
              child: ListView.builder(
                itemCount: _roles.length,
                itemBuilder: (context, index) {
                  final role = _roles[index];
                  final isSelected = _selectedRole == role;

                  return ListTile(
                    title: Text(
                      role,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(
                            AppIcons.check,
                            color: AppColors.primary,
                            size: AppSizes.iconM,
                          )
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedRole = role;
                      });
                      Navigator.pop(context);
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

  void _skip() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'تخطي العنوان السريري',
          style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'هل أنت متأكد من تخطي إضافة العنوان السريري؟ يمكنك إضافته لاحقاً من الإعدادات.',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'إلغاء',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _submitKYC();
            },
            child: Text(
              'تخطي',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitKYC() {
    if (_formKey.currentState!.validate()) {
      if (_selectedRole == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى اختيار دورك المهني'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      // Show success dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.space6),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  AppIcons.success,
                  color: AppColors.success,
                  size: AppSizes.iconXXL,
                ),
              ),
              const SizedBox(height: AppSizes.space4),
              Text(
                'تم إرسال KYC بنجاح!',
                style: AppTextStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.space2),
              Text(
                'سيتم مراجعة بياناتك خلال 24-48 ساعة',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            AppButton(
              text: 'متابعة',
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('/dashboard');
              },
              type: AppButtonType.primary,
              size: AppButtonSize.medium,
              isFullWidth: true,
              icon: AppIcons.forward,
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _clinicNameController.dispose();
    _roleController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
