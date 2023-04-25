import 'package:flutter/material.dart';

class SortDialog extends StatefulWidget {
  final SortEnum sortInitialValue;
  const SortDialog({Key? key, required this.sortInitialValue})
      : super(key: key);

  static Future<SortEnum?> sortDialog(context,
      {required SortEnum initialValue}) async {
    return showDialog<SortEnum?>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SortDialog(sortInitialValue: initialValue);
      },
    );
  }

  @override
  State<SortDialog> createState() => _SortDialogState();
}

class _SortDialogState extends State<SortDialog> {
  SortEnum sortValue = SortEnum.highestReview;

  @override
  void initState() {
    sortValue = widget.sortInitialValue;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sort'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            RadioListTile(
              value: SortEnum.highestReview,
              groupValue: sortValue,
              onChanged: (value) {
                sortValue = value!;
                setState(() {});
              },
              title: const Text("Highest Review"),
            ),
            RadioListTile(
              value: SortEnum.lowestReview,
              groupValue: sortValue,
              onChanged: (value) {
                sortValue = value!;
                setState(() {});
              },
              title: const Text("Lowest Review"),
            ),
            RadioListTile(
              value: SortEnum.highestPrice,
              groupValue: sortValue,
              onChanged: (value) {
                sortValue = value!;
                setState(() {});
              },
              title: const Text("Highest Price"),
            ),
            RadioListTile(
              value: SortEnum.lowestPrice,
              groupValue: sortValue,
              onChanged: (value) {
                sortValue = value!;
                setState(() {});
              },
              title: const Text("Lowest Price"),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Apply'),
          onPressed: () {
            Navigator.of(context).pop(sortValue);
          },
        ),
      ],
    );
  }
}

Future<void> sortDialog(context, VoidCallback onChange) async {
  SortEnum sortValue = SortEnum.highestReview;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sort'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              RadioListTile(
                value: sortValue,
                groupValue: SortEnum.highestReview,
                onChanged: (value) {
                  value = sortValue;
                },
                title: const Text("Highest Review"),
              ),
              RadioListTile(
                value: sortValue,
                groupValue: SortEnum.lowestReview,
                onChanged: (value) {
                  value = sortValue;
                },
                title: const Text("Lowest Review"),
              ),
              RadioListTile(
                value: sortValue,
                groupValue: SortEnum.highestPrice,
                onChanged: (value) {
                  value = sortValue;
                },
                title: const Text("Highest Price"),
              ),
              RadioListTile(
                value: sortValue,
                groupValue: SortEnum.lowestPrice,
                onChanged: (value) {
                  value = sortValue;
                },
                title: const Text("Lowest Price"),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Apply'),
            onPressed: () {
              Navigator.of(context).pop(sortValue);
            },
          ),
        ],
      );
    },
  );
}

enum SortEnum {
  highestReview,
  lowestReview,
  highestPrice,
  lowestPrice,
}
