import AppKeys from '../common/constants/AppKeys';
import LessonStyle from '../common/constants/LessonStyle';
import { LessonScaffold } from '../components/LessonScaffold';
import { MonitorCard } from '../components/MonitorCard';

@Component
export struct Insights {
  @State @Watch('onProgressChange') progress: number = 2200;
  @State milestoneReached: boolean = false;
  @StorageProp(AppKeys.DAILY_GOAL) dailyGoal: number = 5000;
  @StorageProp(AppKeys.ACCENT) accent: string = '#26C6DA';

  onProgressChange(): void {
    this.milestoneReached = this.progress >= this.dailyGoal;
  }

  build() {
    LessonScaffold({
      title: 'Watch changes',
      api: '@Watch · @Monitor',
      intro: 'Run code automatically when a value changes.',
      hint: 'Add progress until you pass the goal — the badge reacts on its own.'
    }) {
      this.demo()
    }
  }

  @Builder
  private demo(): void {
    Column() {
      this.watchCard()

      Column() {
        MonitorCard()
      }
      .width('88%')
      .padding(14)
      .borderRadius(18)
      .backgroundColor(LessonStyle.SURFACE)
      .margin({ bottom: 12 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  private watchCard(): void {
    Column() {
      Text('Progress')
        .fontSize(11)
        .fontColor(this.accent)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 6 })
      Text(`${this.progress} / ${this.dailyGoal}`)
        .fontSize(14)
        .fontColor('#FFFFFF')
        .margin({ bottom: 8 })
      if (this.milestoneReached) {
        Text('Goal reached')
          .fontSize(12)
          .fontColor('#000000')
          .fontWeight(FontWeight.Bold)
          .padding({
            left: 14,
            right: 14,
            top: 6,
            bottom: 6
          })
          .borderRadius(14)
          .backgroundColor(this.accent)
          .margin({ bottom: 8 })
      }
      Button('Add progress')
        .width('90%')
        .height(32)
        .fontSize(11)
        .fontColor('#000000')
        .backgroundColor(this.accent)
        .borderRadius(16)
        .onClick(() => this.progress += 600)
    }
    .width('88%')
    .padding(14)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }
}
