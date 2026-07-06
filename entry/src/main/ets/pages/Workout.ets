import LessonStyle from '../common/constants/LessonStyle';
import { LessonScaffold } from '../components/LessonScaffold';
import { SessionControl } from '../components/SessionControl';
import { StatTile } from '../components/StatTile';

@Component
export struct Workout {
  @State reps: number = 12;
  @State intensity: number = 4;

  build() {
    LessonScaffold({
      title: 'State / Link / Prop',
      api: '@State · @Prop · @Link',
      intro: 'How data flows between a parent and its child components.',
      hint: 'Use both child controls and watch which one changes the parent\'s value.'
    }) {
      this.demo()
    }
  }

  @Builder
  private demo(): void {
    Column() {
      this.ownerCard()
      this.propCard()
      this.linkCard()
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  private ownerCard(): void {
    Column() {
      this.label('Parent', LessonStyle.ACCENT)
      Text(`reps ${this.reps} · intensity ${this.intensity}`)
        .fontSize(14)
        .fontColor('#FFFFFF')
        .margin({ bottom: 8 })
      Button('+1')
        .width('90%')
        .height(32)
        .fontSize(11)
        .fontColor('#000000')
        .backgroundColor(LessonStyle.ACCENT)
        .borderRadius(16)
        .onClick(() => this.reps++)
    }
    .width('88%')
    .padding(14)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }

  @Builder
  private propCard(): void {
    Column() {
      this.label('Stat tile', '#FFB300')
      StatTile({ reps: this.reps })
    }
    .width('88%')
    .padding(14)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }

  @Builder
  private linkCard(): void {
    Column() {
      this.label('Intensity control', LessonStyle.ACCENT)
      SessionControl({ intensity: this.intensity })
    }
    .width('88%')
    .padding(14)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }

  @Builder
  private label(text: string, color: string): void {
    Text(text)
      .fontSize(11)
      .fontColor(color)
      .fontWeight(FontWeight.Medium)
      .margin({ bottom: 6 })
  }
}
