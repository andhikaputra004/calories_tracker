import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nourish/app/theme/app_theme.dart';
import 'package:nourish/features/dashboard/data/repositories/mock_dashboard_repository.dart';
import 'package:nourish/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:nourish/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:nourish/features/dashboard/presentation/screens/dashboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  runApp(const NourishApp());
}

class NourishApp extends StatelessWidget {
  const NourishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nourish',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: BlocProvider(
        create: (_) =>
            DashboardBloc(repository: MockDashboardRepository())
              ..add(const DashboardStarted()),
        child: const DashboardScreen(),
      ),
    );
  }
}
