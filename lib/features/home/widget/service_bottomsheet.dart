import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turkcell_project/core/enums/enums.dart';
import '../state/request_state.dart';
import '../viewmodel/request_viewmodel.dart';

class ServiceBottomSheet extends StatelessWidget {
  const ServiceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    RequestViewmodel viewmodel = context.read<RequestViewmodel>();
    return BlocBuilder<RequestViewmodel, RequestState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: TurkcellServiceEnum.values.map((service) {
            return RadioListTile<TurkcellServiceEnum>(
              title: Text(service.name),
              value: service,
              groupValue: state.req.service,
              onChanged: (value) {
                viewmodel.adjustService(service: service);
                context.pop();
              },
            );
          }).toList(),
        );
      },
    );
  }
}
