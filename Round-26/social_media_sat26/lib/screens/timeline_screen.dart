import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_media_sat26/cubits/timeline_cubit/timeline_cubit.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TimelineCubit>().fetchAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
        leading: const SizedBox(),
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocBuilder<TimelineCubit, TimelineState>(
        builder: (context, state) {
          if (state is TimelineLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TimelineSuccessState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final post = state.data[index].data();
                final timestamp =
                    (post['createdAt'] as Timestamp).microsecondsSinceEpoch;
                final date = DateTime.fromMicrosecondsSinceEpoch(timestamp);
                final time = DateFormat.yMEd().format(date);
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(post['profile_picture']),
                    ),
                    title: Text(post['username']),
                    subtitle: Text(post['content']),
                    trailing: Text(time),
                  ),
                );
              },
            );
          }

          return const SizedBox(
            child: Center(
              child: Text('Try Again Later!'),
            ),
          );
        },
      ),
    );
  }
}
