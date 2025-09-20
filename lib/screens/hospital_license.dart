import 'package:flutter/material.dart';
import '../core/constants/index.dart';
import '../core/widgets/index.dart';

class HospitalLicenseScreen extends StatefulWidget {
  const HospitalLicenseScreen({super.key});

  @override
  State<HospitalLicenseScreen> createState() => _HospitalLicenseScreenState();
}

class _HospitalLicenseScreenState extends State<HospitalLicenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _licNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  DateTime? _selectedDate;
  String? _frontImagePath;
  String? _backImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('رخصة المستشفى'),
        centerTitle: false,
        backgroundColor: AppColors.surfaceContainer,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(AppIcons.back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppSizes.space4),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          boxShadow: AppColors.cardShadow,
        ),
        child: SafeArea(
          child: AppButton(
            text: 'متابعة',
            onPressed: _continue,
            type: AppButtonType.primary,
            size: AppButtonSize.large,
            isFullWidth: true,
            icon: AppIcons.forward,
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

              const SizedBox(height: AppSizes.space6),

              // Upload Sections
              _buildUploadSections(),

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
        gradient: AppColors.primaryGradient,
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
              AppIcons.hospital,
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
                  'رخصة المستشفى',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.textOnPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSizes.space1),
                Text(
                  'أدخل بيانات رخصة المستشفى الخاصة بك',
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
          controller: _nameController,
          label: 'الاسم على الرخصة',
          hint: 'أدخل الاسم كما هو مكتوب على الرخصة',
          prefixIcon: AppIcons.user,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال الاسم';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        AppTextField(
          controller: _licNumberController,
          label: 'رقم الرخصة',
          hint: 'أدخل رقم الرخصة',
          keyboardType: TextInputType.number,
          prefixIcon: AppIcons.medical,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال رقم الرخصة';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        AppTextField(
          controller: _addressController,
          label: 'العنوان على الرخصة',
          hint: 'أدخل العنوان كما هو مكتوب على الرخصة',
          maxLines: 3,
          prefixIcon: AppIcons.location,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال العنوان';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        AppTextField(
          controller: _postalCodeController,
          label: 'الرمز البريدي',
          hint: 'أدخل الرمز البريدي',
          keyboardType: TextInputType.number,
          prefixIcon: AppIcons.location,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال الرمز البريدي';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        GestureDetector(
          onTap: _selectDate,
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
                  AppIcons.date,
                  color: AppColors.primary,
                  size: AppSizes.iconM,
                ),
                const SizedBox(width: AppSizes.space3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تاريخ الميلاد',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        _selectedDate != null
                            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                            : 'اختر التاريخ',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: _selectedDate != null
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
      ],
    );
  }

  Widget _buildUploadSections() {
    return Column(
      children: [
        _buildUploadCard(
          title: 'رفع وجه الرخصة',
          subtitle: 'JPEG, PNG, PDF (حد أدنى 4MB - حد أقصى 8MB)',
          imagePath: _frontImagePath,
          onUpload: () => _uploadImage(true),
          onRemove: () => _removeImage(true),
        ),

        const SizedBox(height: AppSizes.space4),

        _buildUploadCard(
          title: 'رفع ظهر الرخصة',
          subtitle: 'JPEG, PNG, PDF (حد أدنى 4MB - حد أقصى 8MB)',
          imagePath: _backImagePath,
          onUpload: () => _uploadImage(false),
          onRemove: () => _removeImage(false),
        ),
      ],
    );
  }

  Widget _buildUploadCard({
    required String title,
    required String subtitle,
    String? imagePath,
    required VoidCallback onUpload,
    required VoidCallback onRemove,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.space4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                AppIcons.upload,
                color: AppColors.primary,
                size: AppSizes.iconM,
              ),
              const SizedBox(width: AppSizes.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.space4),

          if (imagePath != null) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.space4),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: Border.all(color: AppColors.success.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    AppIcons.success,
                    color: AppColors.success,
                    size: AppSizes.iconM,
                  ),
                  const SizedBox(width: AppSizes.space3),
                  Expanded(
                    child: Text(
                      'تم رفع الملف بنجاح',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onRemove,
                    icon: Icon(
                      AppIcons.close,
                      color: AppColors.error,
                      size: AppSizes.iconS,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            GestureDetector(
              onTap: onUpload,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSizes.space6),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      AppIcons.upload,
                      color: AppColors.primary,
                      size: AppSizes.iconXL,
                    ),
                    const SizedBox(height: AppSizes.space2),
                    Text(
                      'اضغط لرفع الملف',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 20)),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.textOnPrimary,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _uploadImage(bool isFront) {
    // Simulate file upload
    setState(() {
      if (isFront) {
        _frontImagePath = 'uploaded_front_image.jpg';
      } else {
        _backImagePath = 'uploaded_back_image.jpg';
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم رفع ${isFront ? 'وجه' : 'ظهر'} الرخصة بنجاح'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _removeImage(bool isFront) {
    setState(() {
      if (isFront) {
        _frontImagePath = null;
      } else {
        _backImagePath = null;
      }
    });
  }

  void _continue() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى اختيار تاريخ الميلاد'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      if (_frontImagePath == null || _backImagePath == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى رفع وجه وظهر الرخصة'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      Navigator.of(context).pushNamed('/degree');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _licNumberController.dispose();
    _addressController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }
}
