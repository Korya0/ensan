import 'package:ensan_app/core/main/views/mian_view.dart';
import 'package:ensan_app/core/resource/router/app_routes.dart';
import 'package:ensan_app/core/resource/router/app_transitions.dart';
import 'package:ensan_app/features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:ensan_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:ensan_app/features/auth/presentation/views/login_view.dart';
import 'package:ensan_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:ensan_app/features/cart/presentation/views/cart_view.dart';
import 'package:ensan_app/features/donation/presentation/views/donate_view.dart';
import 'package:ensan_app/features/donation/presentation/views/sure_donaation_view.dart';
import 'package:ensan_app/features/home/data/unified_home_data.dart';
import 'package:ensan_app/features/home/presentation/views/category_detail_view.dart';
import 'package:ensan_app/features/home/presentation/views/home_view.dart';
import 'package:ensan_app/features/menu/presentation/views/about_us_view.dart';
import 'package:ensan_app/features/menu/presentation/views/apply_case_view.dart';
import 'package:ensan_app/features/menu/presentation/views/apply_zad_project_view.dart';
import 'package:ensan_app/features/menu/presentation/views/donation_record_view.dart';
import 'package:ensan_app/features/menu/presentation/views/menu_view.dart';
import 'package:ensan_app/features/menu/presentation/views/events_view.dart';
import 'package:ensan_app/features/menu/presentation/views/profile_view.dart';
import 'package:ensan_app/features/menu/presentation/views/settings_view.dart';
import 'package:ensan_app/features/notification/presentation/views/notification_view.dart';
import 'package:ensan_app/features/volunteering/presentation/views/volunteer_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: const OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: LoginView(),
        ),
      ),

      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: SignUpView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.forgotPass,
        name: AppRoutes.forgotPass,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: ForgotPasswordView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.notification,
        name: AppRoutes.notification,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: NotificationView(),
        ),
      ),

      GoRoute(
        path: AppRoutes.settings,
        name: AppRoutes.settings,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: SettingsView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profile,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: ProfileView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.event,
        name: AppRoutes.event,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: EventsView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.donationRecord,
        name: AppRoutes.donationRecord,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: DonationRecordView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.applyCase,
        name: AppRoutes.applyCase,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: ApplyCaseView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.applayZadProject,
        name: AppRoutes.applayZadProject,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: ApplyZadProjectView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.aboutUs,
        name: AppRoutes.aboutUs,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: AboutUsView(),
        ),
      ),
      // ShellRoute for bottom nav
      ShellRoute(
        builder: (context, state, child) => MainView(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.categoryDetail,
            name: AppRoutes.categoryDetail,
            pageBuilder: (context, state) {
              final category = state.extra as CategoryModel;
              return AppTransitions.slideFromRight(
                context: context,
                state: state,
                child: CategoryDetailView(category: category),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.home,
            name: AppRoutes.home,
            pageBuilder: (context, state) => AppTransitions.fadeScale(
              context: context,
              state: state,
              child: const HomeView(),
            ),
          ),
          GoRoute(
            path: AppRoutes.donation,
            name: AppRoutes.donation,
            pageBuilder: (context, state) {
              final projectName = state.extra as String?;
              return AppTransitions.fadeScale(
                context: context,
                state: state,
                child: DonateView(projectName: projectName),
              );
            },
            routes: [
              GoRoute(
                path: AppRoutes.sureDonation,
                name: AppRoutes.sureDonation,
                pageBuilder: (context, state) {
                  final paymentMethod = state.extra as String;
                  return AppTransitions.size(
                    context: context,
                    state: state,
                    child: SureDonaationView(paymentMethod: paymentMethod),
                  );
                },
              ),
            ],
          ),

          GoRoute(
            path: AppRoutes.volunteer,
            name: AppRoutes.volunteer,
            pageBuilder: (context, state) => AppTransitions.fadeScale(
              context: context,
              state: state,
              child: VolunteerView(),
            ),
          ),
          GoRoute(
            path: AppRoutes.cart,
            name: AppRoutes.cart,
            pageBuilder: (context, state) {
              return AppTransitions.fadeScale(
                context: context,
                state: state,
                child: CartView(),
              );
            },
          ),

          GoRoute(
            path: AppRoutes.menu,
            name: AppRoutes.menu,
            pageBuilder: (context, state) => AppTransitions.fadeScale(
              context: context,
              state: state,
              child: MenuView(),
            ),
          ),
        ],
      ),
    ],
  );
}
