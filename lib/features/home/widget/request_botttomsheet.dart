import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/enums/enums.dart';
import '../state/request_state.dart';
import '../viewmodel/request_viewmodel.dart';

class RequestBottomSheet extends StatelessWidget {
  const RequestBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    RequestViewmodel viewmodel = context.read<RequestViewmodel>();
    return BlocBuilder<RequestViewmodel, RequestState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: RequestEnum.values.map((service) {
            return RadioListTile<RequestEnum>(
              title: Text(service.name),
              value: service,
              groupValue: state.req.requestType,
              onChanged: (value) {
                viewmodel.adjustReq(requestType: value);
                context.pop();
              },
            );
          }).toList(),
        );
      },
    );
  }
}
