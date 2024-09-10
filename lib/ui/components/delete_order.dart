import 'package:az_cash/database/database.dart';
import 'package:az_cash/models/controllers.dart/order_controller.dart';
import 'package:az_cash/models/controllers.dart/payment_controller.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DeleteOrder extends StatefulWidget {
  final Order order;
  const DeleteOrder({super.key, required this.order});

  @override
  State<DeleteOrder> createState() => _DeleteOrderState();
}

class _DeleteOrderState extends State<DeleteOrder> {
  bool deleteLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 400,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.softBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 20,
              height: 3,
              margin: const EdgeInsets.only(top: 4),
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(
                          Icons.person_3_outlined,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "User Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("(${widget.order.userId})"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  NumberFormat('#,##0')
                                      .format(widget.order.amount),
                                  style: TextStyle(
                                    color: widget.order.type == "withdraw"
                                        ? Colors.red
                                        : Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  DateFormat("hh:mm a")
                                      .format(widget.order.created),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Reason for Action"),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: MaterialButton(
                color: Colors.red,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    deleteLoading = true;
                  });
                  OrderController().drop(widget.order.id);
                  if (widget.order.type == "deposit") {
                    AppData.totalDepo = AppData.totalDepo - widget.order.amount;
                  } else {
                    AppData.totalWd = AppData.totalWd - widget.order.amount;
                  }

                  Future.delayed(const Duration(seconds: 1), () {
                    Get.back();
                    PaymentController().appStartCheck();
                  });
                },
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: deleteLoading
                        ? const SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Delete"),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: MaterialButton(
                color: Colors.amber,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                onPressed: () {
                  AppMessage.requirePremium();
                },
                child: const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Text("Warning User"),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: MaterialButton(
                color: Colors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                onPressed: () {
                  AppMessage.requirePremium();
                },
                child: const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Text("Block User"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
