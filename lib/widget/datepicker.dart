import 'package:alarm_reminder/widget/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerItem extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final String? date;
  //final VoidCallback f;
  final Function? onSelectionChanged;

  const DatePickerItem(
      {Key? key,
      required this.title,
      this.onTap,
      this.date,
      this.onSelectionChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF071717)),
          ),
          InkWell(
            onTap: () => _onTap(title),
            child: Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0c076df3),
                    blurRadius: 40,
                    offset: Offset(0, 30),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                  ),
                  Space.X(3),
                  Expanded(
                      child: Text(
                    date ?? "",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF071717)),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _onTap(String title, {bool isStartDate = true}) {
    Get.bottomSheet(
      Column(
        children: [
          Text(
            "Please select ${title.toLowerCase()}",
            style: const TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Container(
              width: Get.width * 0.8,
              margin: const EdgeInsets.all(20),
              decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              child: SfDateRangePicker(
                todayHighlightColor: Colors.black.withOpacity(0.4),
                showActionButtons: true,

                showNavigationArrow: true,
                selectionColor: Colors.black.withOpacity(0.4),
                monthViewSettings: const DateRangePickerMonthViewSettings(
                  showTrailingAndLeadingDates: true,
                  numberOfWeeksInView: 6,
                  weekNumberStyle: DateRangePickerWeekNumberStyle(
                    backgroundColor: Colors.black12,
                  ),
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)),
                ),
                monthCellStyle: const DateRangePickerMonthCellStyle(
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
                rangeTextStyle: const TextStyle(color: Colors.black),

                headerStyle: const DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                selectionTextStyle: const TextStyle(color: Colors.white),

                onSelectionChanged: (arg) => onSelectionChanged!(arg),
                // onSelectionChanged(arg) ?? (){},
                onSubmit: (arg) => Get.back(),
                onCancel: () => Get.back(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
