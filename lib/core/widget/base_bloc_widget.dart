import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocStatelessWidget extends StatelessWidget {
  const BaseBlocStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: createProviders(), child: buildChild(context));
  }

  List<BlocProvider<StateStreamableSource<Object?>>> createProviders();

  Widget buildChild(BuildContext context);
}

abstract class BaseBlocState<T extends StatefulWidget> extends State{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: createProviders(context), child: buildChild(context));
  }

  List<BlocProvider<Object?>> createProviders(BuildContext context);

  Widget buildChild(BuildContext context);
}

