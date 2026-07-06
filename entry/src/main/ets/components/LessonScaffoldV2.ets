import LessonStyle from '../common/constants/LessonStyle';

@ComponentV2
export struct LessonScaffoldV2 {
  @Param title: string = '';
  @Param api: string = '';
  @Param intro: string = '';
  @Param hint: string = '';
  @BuilderParam demo: () => void = this.emptyDemo;

  @Builder
  emptyDemo(): void {
  }

  build() {
    Scroll() {
      Column() {
        Text(this.title)
          .fontSize(LessonStyle.TITLE_SIZE)
          .fontColor(LessonStyle.TEXT)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .width(LessonStyle.CONTENT_WIDTH)
          .margin({ top: LessonStyle.TOP_GAP, bottom: 2 })
        if (this.api.length > 0) {
          Text(this.api)
            .fontSize(LessonStyle.API_SIZE)
            .fontColor(LessonStyle.ACCENT)
            .textAlign(TextAlign.Center)
            .width(LessonStyle.CONTENT_WIDTH)
            .margin({ bottom: 6 })
        }
        if (this.intro.length > 0) {
          Text(this.intro)
            .fontSize(LessonStyle.INTRO_SIZE)
            .fontColor(LessonStyle.BODY)
            .textAlign(TextAlign.Center)
            .width(LessonStyle.CONTENT_WIDTH)
            .margin({ bottom: 12 })
        }

        this.demo()

        if (this.hint.length > 0) {
          Text(this.hint)
            .fontSize(LessonStyle.HINT_SIZE)
            .fontColor(LessonStyle.SUBTLE)
            .textAlign(TextAlign.Center)
            .width(LessonStyle.CONTENT_WIDTH)
            .margin({ top: 12 })
        }
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
}
