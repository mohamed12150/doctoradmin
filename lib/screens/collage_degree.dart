import 'package:flutter/material.dart';
import '../core/constants/index.dart';
import '../core/widgets/index.dart';

class CollageDegree extends StatefulWidget {
  const CollageDegree({super.key});

  @override
  State<CollageDegree> createState() => _CollageDegreeState();
}

class _CollageDegreeState extends State<CollageDegree> {
  final _formKey = GlobalKey<FormState>();
  final _instituteNameController = TextEditingController();
  final _instituteAddressController = TextEditingController();
  final _degreeController = TextEditingController();
  int? _selectedBatchYear;
  String? _documentPath;

  final List<int> _batchYears = List.generate(
    50,
    (index) => DateTime.now().year - index,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('الشهادة الجامعية'),
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
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'السابق',
                  onPressed: () => Navigator.of(context).maybePop(),
                  type: AppButtonType.outline,
                  size: AppButtonSize.large,
                  icon: AppIcons.back,
                ),
              ),
              const SizedBox(width: AppSizes.space3),
              Expanded(
                flex: 2,
                child: AppButton(
                  text: 'متابعة',
                  onPressed: _continue,
                  type: AppButtonType.primary,
                  size: AppButtonSize.large,
                  icon: AppIcons.forward,
                ),
              ),
            ],
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

              // Upload Section
              _buildUploadSection(),

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
        gradient: AppColors.accentGradient,
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
              AppIcons.medical,
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
                  'الشهادة الجامعية',
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.textOnPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSizes.space1),
                Text(
                  'أدخل بيانات شهادتك الطبية',
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
          controller: _instituteNameController,
          label: 'اسم المؤسسة التعليمية',
          hint: 'أدخل اسم الجامعة أو الكلية',
          prefixIcon: AppIcons.hospital,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال اسم المؤسسة';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        AppTextField(
          controller: _instituteAddressController,
          label: 'عنوان المؤسسة',
          hint: 'أدخل عنوان الجامعة أو الكلية',
          maxLines: 3,
          prefixIcon: AppIcons.location,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال عنوان المؤسسة';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        AppTextField(
          controller: _degreeController,
          label: 'نوع الشهادة',
          hint: 'مثال: بكالوريوس الطب والجراحة',
          prefixIcon: AppIcons.medical,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال نوع الشهادة';
            }
            return null;
          },
        ),

        const SizedBox(height: AppSizes.space4),

        GestureDetector(
          onTap: _selectBatchYear,
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
                        'سنة التخرج',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        _selectedBatchYear != null
                            ? _selectedBatchYear.toString()
                            : 'اختر سنة التخرج',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: _selectedBatchYear != null
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

  Widget _buildUploadSection() {
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
                color: AppColors.accent,
                size: AppSizes.iconM,
              ),
              const SizedBox(width: AppSizes.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'رفع وثائق الشهادة',
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'JPEG, PNG, PDF (حد أدنى 4MB - حد أقصى 8MB)',
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

          if (_documentPath != null) ...[
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
                      'تم رفع الوثيقة بنجاح',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _removeDocument,
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
              onTap: _uploadDocument,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSizes.space6),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  border: Border.all(
                    color: AppColors.accent.withOpacity(0.3),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      AppIcons.upload,
                      color: AppColors.accent,
                      size: AppSizes.iconXL,
                    ),
                    const SizedBox(height: AppSizes.space2),
                    Text(
                      'اضغط لرفع الوثيقة',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.accent,
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

  void _selectBatchYear() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusL),
        ),
      ),
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(AppSizes.space4),
        child: Column(
          children: [
            Text(
              'اختر سنة التخرج',
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSizes.space4),
            Expanded(
              child: ListView.builder(
                itemCount: _batchYears.length,
                itemBuilder: (context, index) {
                  final year = _batchYears[index];
                  final isSelected = _selectedBatchYear == year;

                  return ListTile(
                    title: Text(
                      year.toString(),
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
                        _selectedBatchYear = year;
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

  void _uploadDocument() {
    // Simulate file upload
    setState(() {
      _documentPath = 'uploaded_degree_document.pdf';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم رفع الوثيقة بنجاح'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _removeDocument() {
    setState(() {
      _documentPath = null;
    });
  }

  void _continue() {
    if (_formKey.currentState!.validate()) {
      if (_selectedBatchYear == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى اختيار سنة التخرج'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      if (_documentPath == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى رفع وثيقة الشهادة'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      Navigator.of(context).pushNamed('/clinic');
    }
  }

  @override
  void dispose() {
    _instituteNameController.dispose();
    _instituteAddressController.dispose();
    _degreeController.dispose();
    super.dispose();
  }
}
