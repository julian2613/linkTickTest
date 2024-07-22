import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/app/infrastructure/presentation/category/controllers/bloc/category.controller.dart';
import 'package:pos/app/infrastructure/presentation/warehouse/controllers/warehouse.controller.dart';
import 'package:pos/app/infrastructure/repositories/category/http/category_http.repository.dart';
import 'package:pos/app/infrastructure/repositories/warehouse/http/warehouse_http.repository.dart';
import 'package:pos/shared/infrastructure/presentation/main/pages/custom_theme.dart';
import 'package:pos/shared/infrastructure/presentation/main/pages/router.dart';
import 'package:pos/shared/infrastructure/presentation/vertical_menu/controllers/vetical_menu.controller.dart';
import 'package:pos/shared/infrastructure/repositories/vertical_menu/local/vertical_menu_local_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final warehouseHttpRepository = WarehouseHttpRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => VerticalMenuController(
            repositoy: VerticalMenuLocalRepository(),
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => WarehouseController(
            repositoy: warehouseHttpRepository,
          ),
        ),
        BlocProvider(
          create: (_) => CategoryController(
            repositoy: CategoryHttpRepository(),
            warehouseRepositoy: warehouseHttpRepository,
          ),
        )
      ],
      child: MaterialApp.router(
        title: 'POS',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme().theme(),
        routerConfig: router,
      ),
    );
  }
}
