import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/bloc/shelf_page_bloc.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:provider/provider.dart';

class CreateNewShelfDialog extends StatelessWidget {
  const CreateNewShelfDialog({
    super.key,
    required this.titleController,
    required this.shelfList,
  });

  final TextEditingController titleController;
  final List shelfList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShelfPageBloc>(
      create: (context) => ShelfPageBloc(),
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Shelf Title",
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  (value != null && value.isEmpty) ? 'Required' : null,
            ),
            const Gap(kSP15x),
            CreateButton(titleController: titleController, shelfList: shelfList)
          ],
        ),
      ),
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton(
      {super.key, required this.titleController, required this.shelfList});

  final TextEditingController titleController;
  final List shelfList;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final bloc = context.read<ShelfPageBloc>();
          bloc.addNewShelf(context, titleController, shelfList);
        },
        child: const Text("Create"));
  }
}
