import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageFormFieldWidget extends FormField<Uint8List?> {
  final TextEditingController? controller;

  ImageFormFieldWidget({
    super.key,
    this.controller,
  }) : super(builder: (FormFieldState<Uint8List?> state) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                FilePickerResult? file = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                );
                state.didChange(file?.files.first.bytes);
                if (state.value != null) {
                  controller?.text = base64.encode(state.value!.toList());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 150,
                height: 150,
                child: state.value != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.memory(state.value!),
                      )
                    : controller?.text != ''
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(controller!.text),
                          )
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.category_outlined,
                                size: 48,
                              ),
                              Text('Imagen'),
                            ],
                          ),
              ),
            ),
          );
        });
}
