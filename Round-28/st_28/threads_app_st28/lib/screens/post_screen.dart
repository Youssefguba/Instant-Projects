import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_app_st28/cubits/add_post_cubit/add_new_post_cubit.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final addNewPostCubit = AddNewPostCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addNewPostCubit,
      child: BlocBuilder<AddNewPostCubit, AddNewPostState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                TextButton(
                  onPressed: state is AddNewPostLoading
                      ? null
                      : () {
                          addNewPostCubit.addPost(context);
                        },
                  child: const Text('Post'),
                ),
              ],
            ),
            body: state is AddNewPostLoading
                ? const Center(child: CircularProgressIndicator())
                : TextFormField(
                    controller: addNewPostCubit.controller,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Ehbd Ay kalam',
                    ),
                    maxLines: 50,
                  ),
          );
        },
      ),
    );
  }
}
