import 'package:book_app/%20core/utils/app_router.dart';
import 'package:book_app/%20core/utils/assets.dart';
  import 'package:book_app/features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
     super.initState();
     initSlidingAnimation();
     getHome();

  }

  @override
  void dispose() {
     super.dispose();
     animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4.0,),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
  void initSlidingAnimation(){

    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    );
    slidingAnimation = Tween<Offset>(begin: const Offset(0,2),end: Offset.zero )
        .animate(animationController);
    animationController.forward();
  }

  void getHome(){
    Future.delayed(const Duration(seconds: 2), (){
    //   Get.to(() => const HomeView() ,
    //     transition: Transition.fade ,
    //     duration: kTranstionDuration,
    //   );
      GoRouter.of(context).push(AppRouter.kHomeView);
     },
      );
  }
}


