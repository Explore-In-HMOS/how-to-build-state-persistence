import AppKeys from '../common/constants/AppKeys';
import PageRoutes from '../common/constants/PageRoutes';
import AppNavigator from '../common/util/AppNavigator';
import { registerPersistErrorLogging } from '../model/persistence';
import {
  BasicsRouteBuilder,
  DisplayRouteBuilder,
  HomeRouteBuilder,
  InsightsRouteBuilder,
  SettingsRouteBuilder,
  WorkoutRouteBuilder
} from './RouteBuilders';

registerPersistErrorLogging();

@Entry
@Component
struct Index {
  private pathStack: NavPathStack = new NavPathStack();

  aboutToAppear() {
    AppNavigator.setPathStack(this.pathStack);
    this.seedAppState();
  }

  build() {
    Navigation(this.pathStack) {
    }
    .mode(NavigationMode.Stack)
    .hideNavBar(true)
    .navDestination(this.pageMap)
    .onAppear(() => this.seedInitialRoute())
    .width('100%')
    .height('100%')
  }

  private seedAppState(): void {
    AppStorage.setOrCreate<string>(AppKeys.UNITS, 'km');
    AppStorage.setOrCreate<boolean>(AppKeys.HAPTICS, true);
    AppStorage.setOrCreate<number>(AppKeys.DAILY_GOAL, 5000);
    AppStorage.setOrCreate<string>(AppKeys.ACCENT, '#26C6DA');
    Environment.envProp('languageCode', 'en');
  }

  @Builder
  private pageMap(name: string) {
    if (name === PageRoutes.HOME) {
      HomeRouteBuilder();
    } else if (name === PageRoutes.BASICS) {
      BasicsRouteBuilder();
    } else if (name === PageRoutes.WORKOUT) {
      WorkoutRouteBuilder();
    } else if (name === PageRoutes.SETTINGS) {
      SettingsRouteBuilder();
    } else if (name === PageRoutes.DISPLAY) {
      DisplayRouteBuilder();
    } else if (name === PageRoutes.INSIGHTS) {
      InsightsRouteBuilder();
    }
  }

  private seedInitialRoute(): void {
    if (this.pathStack.size() === 0) {
      this.pathStack.pushPath({ name: PageRoutes.HOME });
    }
  }
}
