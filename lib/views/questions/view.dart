import 'package:flutter/material.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  final list = [
    "Text",
    "Image.network",
    "Image.asset",
    "Other",
  ];

  int selectedItem = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions App"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3C85F2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff3C85F2).withOpacity(.22)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What is the Widget Used To Make Network Image?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ...List.generate(
                    list.length,
                    (index) => Column(
                      children: [
                        RadioListTile(
                          value: index,
                          title: Text(list[index]),
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          groupValue: selectedItem,
                          onChanged: (value) {
                            selectedItem = value!;
                            setState(() {});
                          },
                        ),
                        if (index == list.length - 1 && index == selectedItem)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(),
                          )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
