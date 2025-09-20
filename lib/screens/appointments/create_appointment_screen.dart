import 'package:flutter/material.dart';
import '../../core/constants/index.dart';
import '../../core/widgets/index.dart';
import '../../core/widgets/shared/language_switcher.dart';

class CreateAppointmentScreen extends StatefulWidget {
  const CreateAppointmentScreen({super.key});

  @override
  State<CreateAppointmentScreen> createState() =>
      _CreateAppointmentScreenState();
}

class _CreateAppointmentScreenState extends State<CreateAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _patientNameController = TextEditingController();
  final _patientPhoneController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedType = 'استشارة طبية';
  String _selectedDuration = '30 دقيقة';

  final List<String> _appointmentTypes = [
    'استشارة طبية',
    'فحص دوري',
    'متابعة حالة',
    'استشارة عاجلة',
  ];

  final List<String> _durations = [
    '15 دقيقة',
    '30 دقيقة',
    '45 دقيقة',
    '60 دقيقة',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(AppStrings.createNewAppointment),
        centerTitle: false,
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(AppIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // Language Switcher
          const Padding(
            padding: EdgeInsets.only(right: AppSizes.space2),
            child: LanguageSwitcherChip(),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSizes.paddingS),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppSizes.radiusS,
                            ),
                          ),
                          child: Icon(
                            AppIcons.appointments,
                            color: AppColors.primary,
                            size: AppSizes.iconM,
                          ),
                        ),
                        const SizedBox(width: AppSizes.paddingM),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'معلومات الموعد',
                                style: AppTextStyles.h6.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'أدخل تفاصيل الموعد الجديد',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.paddingL),

              // Patient Information
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'معلومات المريض',
                      style: AppTextStyles.h6.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSizes.paddingL),

                    AppTextField(
                      controller: _patientNameController,
                      label: 'اسم المريض',
                      hint: 'أدخل اسم المريض',
                      prefixIcon: AppIcons.user,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال اسم المريض';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: AppSizes.paddingM),

                    AppTextField(
                      controller: _patientPhoneController,
                      label: 'رقم الهاتف',
                      hint: 'أدخل رقم الهاتف',
                      keyboardType: TextInputType.phone,
                      prefixIcon: AppIcons.call,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال رقم الهاتف';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.paddingM),

              // Appointment Details
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تفاصيل الموعد',
                      style: AppTextStyles.h6.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSizes.paddingL),

                    // Date Selection
                    GestureDetector(
                      onTap: _selectDate,
                      child: Container(
                        padding: const EdgeInsets.all(AppSizes.paddingM),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              AppIcons.appointments,
                              color: AppColors.primary,
                              size: AppSizes.iconM,
                            ),
                            const SizedBox(width: AppSizes.paddingM),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.appointmentDate,
                                    style: AppTextStyles.bodyMedium.copyWith(
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

                    const SizedBox(height: AppSizes.paddingM),

                    // Time Selection
                    GestureDetector(
                      onTap: _selectTime,
                      child: Container(
                        padding: const EdgeInsets.all(AppSizes.paddingM),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              AppIcons.clock,
                              color: AppColors.primary,
                              size: AppSizes.iconM,
                            ),
                            const SizedBox(width: AppSizes.paddingM),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.appointmentTime,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  Text(
                                    _selectedTime != null
                                        ? '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
                                        : 'اختر الوقت',
                                    style: AppTextStyles.bodyLarge.copyWith(
                                      color: _selectedTime != null
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

                    const SizedBox(height: AppSizes.paddingM),

                    // Appointment Type
                    DropdownButtonFormField<String>(
                      value: _selectedType,
                      decoration: InputDecoration(
                        labelText: 'نوع الموعد',
                        prefixIcon: Icon(
                          AppIcons.medical,
                          color: AppColors.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        ),
                        filled: true,
                        fillColor: AppColors.surface,
                      ),
                      items: _appointmentTypes.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedType = newValue!;
                        });
                      },
                    ),

                    const SizedBox(height: AppSizes.paddingM),

                    // Duration
                    DropdownButtonFormField<String>(
                      value: _selectedDuration,
                      decoration: InputDecoration(
                        labelText: 'مدة الموعد',
                        prefixIcon: Icon(
                          AppIcons.clock,
                          color: AppColors.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        ),
                        filled: true,
                        fillColor: AppColors.surface,
                      ),
                      items: _durations.map((String duration) {
                        return DropdownMenuItem<String>(
                          value: duration,
                          child: Text(duration),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDuration = newValue!;
                        });
                      },
                    ),

                    const SizedBox(height: AppSizes.paddingM),

                    // Notes
                    AppTextField(
                      controller: _notesController,
                      label: 'ملاحظات (اختياري)',
                      hint: 'أدخل أي ملاحظات إضافية',
                      maxLines: 3,
                      prefixIcon: AppIcons.message,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.paddingXL),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'إلغاء',
                      onPressed: () => Navigator.pop(context),
                      type: AppButtonType.outline,
                      size: AppButtonSize.large,
                      icon: AppIcons.close,
                    ),
                  ),
                  const SizedBox(width: AppSizes.paddingM),
                  Expanded(
                    child: AppButton(
                      text: 'حفظ الموعد',
                      onPressed: _saveAppointment,
                      type: AppButtonType.primary,
                      size: AppButtonSize.large,
                      icon: AppIcons.save,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
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

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveAppointment() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى اختيار تاريخ الموعد'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      if (_selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى اختيار وقت الموعد'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      // Save appointment logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم حفظ الموعد بنجاح'),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _patientNameController.dispose();
    _patientPhoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}
