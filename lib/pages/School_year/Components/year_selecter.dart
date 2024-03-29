import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flluter2cpi/pages/School_year/school_year_view_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YearSelecter extends StatelessWidget {
  const YearSelecter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = 25 * (((size.height / 844) + (size.width / 390)) / 2);
    return Container(
      width: 325.w,
      height: 50.h,

      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: const Color.fromRGBO(239, 238, 238, 1),
        border: Border.all(color: const Color.fromRGBO(33, 33, 33, 1)),
      ),
      child: Consumer<SchoolYearViewModel>(
        builder: (context, state, child) => DropdownButtonHideUnderline(
          child: DropdownButton2(
            value: state.selectedYear,
            hint: Text(
              "School year",
              style: GoogleFonts.poppins(
                  fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            items: ["1 Cpi", "2 Cpi", "1 Cs", "2 Cs", "3 Cs"]
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                   
                  ),
                )
                .toList(),
            onChanged: (newYear) {
              state.setYear = newYear;
             // state.selectYear(newYear);
            },
            onMenuStateChange: (isOpen) => state.menuOpened(isOpen),
            iconStyleData: IconStyleData(
              iconSize: iconSize,
              icon: Icon(
                state.menuOpen
                    ? FluentIcons.chevron_circle_down_24_filled
                    : FluentIcons.chevron_circle_left_24_filled,
                color: const Color.fromRGBO(33, 33, 33, 1),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              width: 80.w,
              elevation: 0,
              openInterval:
                  const Interval(0.5, 1, curve: Curves.linearToEaseOut),
              direction: DropdownDirection.left,
              scrollPadding: EdgeInsets.symmetric(vertical: 1.h),
              //padding: EdgeInsets.symmetric(vertical: 3.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: const Color.fromRGBO(239, 238, 238, 1),
                border: Border.all(color: const Color.fromRGBO(33, 33, 33, 1)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
