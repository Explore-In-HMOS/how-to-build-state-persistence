import LessonStyle from '../common/constants/LessonStyle';
import PageRoutes from '../common/constants/PageRoutes';
import AppNavigator from '../common/util/AppNavigator';

interface Lesson {
  title: string;
  api: string;
  route: string;
}

@Component
export struct Home {
  private lessons: Lesson[] = [
    { title: 'Persist state', api: 'PersistenceV2', route: PageRoutes.DISPLAY },
    { title: 'State basics', api: 'StateManagement core', route: PageRoutes.BASICS },
    { title: 'State / Link / Prop', api: '@State · @Prop · @Link', route: PageRoutes.WORKOUT },
    { title: 'AppStorage / Environment', api: 'app-level variables', route: PageRoutes.SETTINGS },
    { title: 'Watch changes', api: '@Watch · @Monitor', route: PageRoutes.INSIGHTS }
  ];

  build() {
    Scroll() {
      Column() {
        Text('State Management')
          .fontSize(16)
          .fontColor(LessonStyle.TEXT)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 28, bottom: 14 })

        ForEach(this.lessons, (lesson: Lesson) => {
          this.lessonRow(lesson)
        }, (lesson: Lesson) => lesson.route)

        Blank().height(24)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .backgroundColor(LessonStyle.BG)
  }

  @Builder
  private lessonRow(lesson: Lesson): void {
    Column() {
      Text(lesson.title)
        .fontSize(13)
        .fontColor(LessonStyle.TEXT)
        .fontWeight(FontWeight.Medium)
      Text(lesson.api)
        .fontSize(10)
        .fontColor(LessonStyle.ACCENT)
        .margin({ top: 2 })
    }
    .width('86%')
    .alignItems(HorizontalAlign.Start)
    .padding({
      top: 12,
      bottom: 12,
      left: 16,
      right: 16
    })
    .borderRadius(16)
    .backgroundColor(LessonStyle.SURFACE)
    .margin({ bottom: 8 })
    .onClick(() => AppNavigator.push(lesson.route))
  }
}
