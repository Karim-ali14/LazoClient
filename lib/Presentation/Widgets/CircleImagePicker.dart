import 'dart:convert';
import 'dart:io';
import 'package:lazo_client/Presentation/Dialogs/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/Extintions.dart';
import 'CircleImage.dart';
import 'SvgIcons.dart';

class CircleImgPicker extends StatefulWidget {
  final String? initialImg;
  final double? size;
  final Widget? placeHolder;
  final Function(String, String) onResult;
  CircleImgPicker(
      {Key? key,
      this.size,
      required this.onResult,
      this.initialImg,
      this.placeHolder})
      : super(key: key);

  @override
  State<CircleImgPicker> createState() => _CircleImgPickerState();
}

class _CircleImgPickerState extends State<CircleImgPicker> {
  final ImagePicker _picker = ImagePicker();
  String? imgPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.showSelectionActionSheet(imagePickOptions, onSelect,
            header: "Add Image");
      },
      child: SizedBox(
        width: widget.size ?? 50,
        height: widget.size ?? 50,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: widget.size ?? 88,
              height: widget.size ?? 88,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: imgPath != null
                  ? Image.file(
                      File(imgPath ?? ""),
                      fit: BoxFit.cover,
                    )
                  : (widget.initialImg != null
                      ? ImageView(
                          initialImg: widget.initialImg)
                      : widget.placeHolder),
            ),
            Positioned(
                child: IconButton(
                  onPressed: () async {
                    context.showSelectionActionSheet(imagePickOptions, onSelect,
                        header: "Add Image");
                  },
                  icon: SVGIcons.itemsIcon(),
                ))
          ],
        ),
      ),
    );
  }

  void onSelect(int pos) async {
    if (pos == 0) {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera, imageQuality: 10);
      if (image != null) {
        setState(() => imgPath = image.path);
        image.readAsBytes().then((value) {
          widget.onResult.call(image.path, base64Encode(value));
        });
      }
    } else if (pos == 1) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
      if (image != null) {
        setState(() => imgPath = image.path);
        image.readAsBytes().then((value) {
          widget.onResult.call(image.path, base64Encode(value));
        });
      }
    }
  }
}
