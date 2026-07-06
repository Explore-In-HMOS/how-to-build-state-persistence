import LessonStyle from '../common/constants/LessonStyle';
import { LessonScaffold } from '../components/LessonScaffold';

@Component
export struct StateBasics {
  @State count: number = 0;

  build() {
    LessonScaffold({
      title: 'State basics',
      api: 'StateManagement core',
      intro: 'State is observed and only dependent UI re-renders.',
      hint: 'Tap +1: the live line updates, the static line never does.'
    }) {
      this.demo()
    }
  }

  @Builder
  private demo(): void {
    Column() {
      Text(`Live (reads state): ${this.count}`)
        .fontSize(13)
        .fontColor(LessonStyle.TEXT)
        .margin({ bottom: 6 })
      Text('Static (ignores state)')
        .fontSize(13)
        .fontColor(LessonStyle.SUBTLE)
        .margin({ bottom: 12 })

      Button('+1')
        .width('70%')
        .height(36)
        .fontSize(13)
        .fontColor('#000000')
        .backgroundColor(LessonStyle.ACCENT)
        .borderRadius(18)
        .onClick(() => this.count++)
    }
    .width(LessonStyle.CONTENT_WIDTH)
    .padding(16)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
  }
}
