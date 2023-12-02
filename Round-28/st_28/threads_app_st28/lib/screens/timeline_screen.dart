import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:threads_app_st28/cubits/timeline_cubit/timeline_cubit.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TimelineCubit>().getTimeline();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimelineCubit, TimelineState>(
      builder: (context, state) {
        if (state is TimelineSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final singlePost = state.posts[index];
              initializeDateFormatting();
              final date = DateFormat.yMEd('ar').format(
                DateTime.parse(
                  singlePost.data()['createdAt'],
                ),
              );

              // FirebaseFirestore.instance.collection('users').where(
              //       'userId',
              //       isEqualTo: singlePost.data()['authorId'],
              //     ).get();

              return ListTile(
                title: Text('Author'),
                subtitle: Text(singlePost.data()['content']),
                trailing: Text(
                  date.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              );
            },
          );
        }

        if (state is TimelineLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const SizedBox();
      },
    );
  }
}
