import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:scolar_pay/app/ui/styles/colors.dart';
import 'package:scolar_pay/app/utils/widget_utils.dart';

class DeletedFileContainer extends StatelessWidget {
  final PlatformFile platformFile;
  final Function onDelete;
  const DeletedFileContainer(
      {Key? key, required this.onDelete, required this.platformFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: const [10, 10],
        radius: const Radius.circular(10.0),
        color: black40Color.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Row(
            children: [
              SizedBox(
                width: boxConstraints.maxWidth * (0.75),
                child: getCustomFont(platformFile.name, 15, black40Color, 1)
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    onDelete();
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
        ),
      );
    });
  }
}

// DeletedFileContainer(
//                   platformFile: PlatformFile(
//                     name: "example_file.txt",
//                     size: 1024,
//                     path: "/path/to/example_file.txt",
//                   ),
//                   onDelete: () {
//                     print("File deleted!");
//                     // Ajoutez ici la logique pour supprimer le fichier
//                     // Vous pouvez utiliser les informations de PlatformFile pour identifier le fichier à supprimer
//                   },
//                 ),