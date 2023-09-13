import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class PopOverPage extends StatefulWidget {
  const PopOverPage({Key? key}) : super(key: key);

  @override
  State<PopOverPage> createState() => _PopOverPageState();
}

class _PopOverPageState extends State<PopOverPage> {
  late List<bool> isSelectedList;

  @override
  void initState() {
    super.initState();

    isSelectedList = List.generate(2, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pop Over Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Builder(
              builder: (context) {
                return MyPopoverWidget(
                  context: context,
                  popOverOptions: const [
                    {
                      "label": "Appointments",
                    },
                    {
                      "label": "Treatments",
                    },
                  ],
                  isSelectedList: isSelectedList,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyPopoverWidget extends StatefulWidget {
  final List<Map<String, dynamic>> popOverOptions;
  final BuildContext context;
  final List<bool> isSelectedList;

  const MyPopoverWidget({
    super.key,
    required this.isSelectedList,
    required this.popOverOptions,
    required this.context,
  });

  @override
  State<MyPopoverWidget> createState() => _MyPopoverWidgetState();
}

class _MyPopoverWidgetState extends State<MyPopoverWidget> {
  void _showPopOver(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    await showPopover(
      direction: PopoverDirection.bottom,
      width: size.width * 0.6,
      context: context,
      radius: 20,
      bodyBuilder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.popOverOptions.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Checkbox(
                  value: widget.isSelectedList[index],
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        widget.isSelectedList[index] = value;
                        print(value);
                      });
                    }
                  },
                ),
                Text("${widget.popOverOptions[index]['label']}"),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _showPopOver(context);
      },
      icon: const Icon(Icons.list, size: 40,),
    );
  }
}
