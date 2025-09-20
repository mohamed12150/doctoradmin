import 'package:flutter/material.dart';
import '../../constants/index.dart';

enum ScreenSize { mobile, tablet, desktop, largeDesktop }

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? largeDesktop;
  final Widget Function(BuildContext context, ScreenSize screenSize)? builder;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = _getScreenSize(context);

    if (builder != null) {
      return builder!(context, screenSize);
    }

    switch (screenSize) {
      case ScreenSize.mobile:
        return mobile;
      case ScreenSize.tablet:
        return tablet ?? mobile;
      case ScreenSize.desktop:
        return desktop ?? tablet ?? mobile;
      case ScreenSize.largeDesktop:
        return largeDesktop ?? desktop ?? tablet ?? mobile;
    }
  }

  static ScreenSize _getScreenSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= AppSizes.screenWidthXLarge) {
      return ScreenSize.largeDesktop;
    } else if (width >= AppSizes.screenWidthLarge) {
      return ScreenSize.desktop;
    } else if (width >= AppSizes.screenWidthThreshold) {
      return ScreenSize.tablet;
    } else {
      return ScreenSize.mobile;
    }
  }

  static bool isMobile(BuildContext context) {
    return _getScreenSize(context) == ScreenSize.mobile;
  }

  static bool isTablet(BuildContext context) {
    return _getScreenSize(context) == ScreenSize.tablet;
  }

  static bool isDesktop(BuildContext context) {
    return _getScreenSize(context) == ScreenSize.desktop;
  }

  static bool isLargeDesktop(BuildContext context) {
    return _getScreenSize(context) == ScreenSize.largeDesktop;
  }

  static bool isMobileOrTablet(BuildContext context) {
    final screenSize = _getScreenSize(context);
    return screenSize == ScreenSize.mobile || screenSize == ScreenSize.tablet;
  }

  static bool isTabletOrDesktop(BuildContext context) {
    final screenSize = _getScreenSize(context);
    return screenSize == ScreenSize.tablet || screenSize == ScreenSize.desktop;
  }

  static bool isDesktopOrLarger(BuildContext context) {
    final screenSize = _getScreenSize(context);
    return screenSize == ScreenSize.desktop ||
        screenSize == ScreenSize.largeDesktop;
  }
}

class ResponsiveValue<T> {
  final T mobile;
  final T? tablet;
  final T? desktop;
  final T? largeDesktop;

  const ResponsiveValue({
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  T getValue(BuildContext context) {
    final screenSize = ResponsiveBuilder._getScreenSize(context);

    switch (screenSize) {
      case ScreenSize.mobile:
        return mobile;
      case ScreenSize.tablet:
        return tablet ?? mobile;
      case ScreenSize.desktop:
        return desktop ?? tablet ?? mobile;
      case ScreenSize.largeDesktop:
        return largeDesktop ?? desktop ?? tablet ?? mobile;
    }
  }
}

class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets? mobile;
  final EdgeInsets? tablet;
  final EdgeInsets? desktop;
  final EdgeInsets? largeDesktop;

  const ResponsivePadding({
    super.key,
    required this.child,
    this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveValue<EdgeInsets>(
      mobile: mobile ?? const EdgeInsets.all(AppSizes.space4),
      tablet: tablet ?? const EdgeInsets.all(AppSizes.space6),
      desktop: desktop ?? const EdgeInsets.all(AppSizes.space8),
      largeDesktop: largeDesktop ?? const EdgeInsets.all(AppSizes.space10),
    ).getValue(context);

    return Padding(padding: padding, child: child);
  }
}

class ResponsiveSpacing extends StatelessWidget {
  final Widget child;
  final double? mobile;
  final double? tablet;
  final double? desktop;
  final double? largeDesktop;

  const ResponsiveSpacing({
    super.key,
    required this.child,
    this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = ResponsiveValue<double>(
      mobile: mobile ?? AppSizes.space4,
      tablet: tablet ?? AppSizes.space6,
      desktop: desktop ?? AppSizes.space8,
      largeDesktop: largeDesktop ?? AppSizes.space10,
    ).getValue(context);

    return SizedBox(height: spacing, child: child);
  }
}

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? mobile;
  final TextStyle? tablet;
  final TextStyle? desktop;
  final TextStyle? largeDesktop;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const ResponsiveText({
    super.key,
    required this.text,
    this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = ResponsiveValue<TextStyle>(
      mobile: mobile ?? AppTextStyles.bodyMedium,
      tablet: tablet ?? AppTextStyles.bodyLarge,
      desktop: desktop ?? AppTextStyles.titleMedium,
      largeDesktop: largeDesktop ?? AppTextStyles.titleLarge,
    ).getValue(context);

    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final int? largeDesktopColumns;
  final double? spacing;
  final double? runSpacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
    this.largeDesktopColumns,
    this.spacing,
    this.runSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final columns = ResponsiveValue<int>(
      mobile: mobileColumns ?? 1,
      tablet: tabletColumns ?? 2,
      desktop: desktopColumns ?? 3,
      largeDesktop: largeDesktopColumns ?? 4,
    ).getValue(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing ?? AppSizes.space4,
        mainAxisSpacing: runSpacing ?? AppSizes.space4,
        childAspectRatio: 1.0,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? spacing;
  final bool? wrap;

  const ResponsiveRow({
    super.key,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.spacing,
    this.wrap,
  });

  @override
  Widget build(BuildContext context) {
    final shouldWrap = ResponsiveValue<bool>(
      mobile: wrap ?? true,
      tablet: wrap ?? false,
      desktop: wrap ?? false,
      largeDesktop: wrap ?? false,
    ).getValue(context);

    if (shouldWrap) {
      return Wrap(
        spacing: spacing ?? AppSizes.space2,
        runSpacing: spacing ?? AppSizes.space2,
        children: children,
      );
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: children
          .map(
            (child) => [
              child,
              if (children.indexOf(child) < children.length - 1)
                SizedBox(width: spacing ?? AppSizes.space2),
            ],
          )
          .expand((element) => element)
          .toList(),
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? spacing;

  const ResponsiveColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: children
          .map(
            (child) => [
              child,
              if (children.indexOf(child) < children.length - 1)
                SizedBox(height: spacing ?? AppSizes.space2),
            ],
          )
          .expand((element) => element)
          .toList(),
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? mobileWidth;
  final double? tabletWidth;
  final double? desktopWidth;
  final double? largeDesktopWidth;
  final double? mobileHeight;
  final double? tabletHeight;
  final double? desktopHeight;
  final double? largeDesktopHeight;
  final EdgeInsets? mobilePadding;
  final EdgeInsets? tabletPadding;
  final EdgeInsets? desktopPadding;
  final EdgeInsets? largeDesktopPadding;
  final Color? color;
  final Decoration? decoration;
  final BoxConstraints? constraints;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.mobileWidth,
    this.tabletWidth,
    this.desktopWidth,
    this.largeDesktopWidth,
    this.mobileHeight,
    this.tabletHeight,
    this.desktopHeight,
    this.largeDesktopHeight,
    this.mobilePadding,
    this.tabletPadding,
    this.desktopPadding,
    this.largeDesktopPadding,
    this.color,
    this.decoration,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveValue<double?>(
      mobile: mobileWidth,
      tablet: tabletWidth,
      desktop: desktopWidth,
      largeDesktop: largeDesktopWidth,
    ).getValue(context);

    final height = ResponsiveValue<double?>(
      mobile: mobileHeight,
      tablet: tabletHeight,
      desktop: desktopHeight,
      largeDesktop: largeDesktopHeight,
    ).getValue(context);

    final padding = ResponsiveValue<EdgeInsets?>(
      mobile: mobilePadding,
      tablet: tabletPadding,
      desktop: desktopPadding,
      largeDesktop: largeDesktopPadding,
    ).getValue(context);

    return Container(
      width: width,
      height: height,
      padding: padding,
      color: color,
      decoration: decoration,
      constraints: constraints,
      child: child,
    );
  }
}
