import 'package:go_router/go_router.dart';
import 'package:pos/app/infrastructure/presentation/category/pages/category.page.dart';
import 'package:pos/app/infrastructure/presentation/category/pages/create_category.page.dart';
import 'package:pos/app/infrastructure/presentation/warehouse/pages/create_warehouse.page.dart';
import 'package:pos/app/infrastructure/presentation/warehouse/pages/warehouse.page.dart';
import 'package:pos/shared/infrastructure/presentation/home/pages/home.page.dart';

final router = GoRouter(
  initialLocation: '/warehouse',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(
        child: child,
      ),
      routes: [
        GoRoute(
          name: WarehousePage.name,
          path: '/warehouse',
          builder: (context, state) => const WarehousePage(),
        ),
        GoRoute(
          name: CreateWarehousePage.name,
          path: '/warehouse/create',
          builder: (context, state) => const CreateWarehousePage(),
        ),
        GoRoute(
          name: CategoryPage.name,
          path: '/category',
          builder: (context, state) => const CategoryPage(),
        ),
        GoRoute(
          name: CreateCategoryPage.name,
          path: '/category/create',
          builder: (context, state) => const CreateCategoryPage(),
        ),
      ],
    ),
  ],
);
