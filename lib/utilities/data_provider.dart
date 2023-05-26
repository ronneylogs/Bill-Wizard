import 'dart:async';

import 'package:billwizard/utilities/models/receipt_model.dart';
import 'package:billwizard/utilities/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

final receiptDataProvider = FutureProvider<List<ReceiptModel>>((
  ref,
) async {
  return ref.read(receiptProvider).getReceipts();
});
