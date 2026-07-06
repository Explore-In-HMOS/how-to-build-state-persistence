import AppKeys from '../common/constants/AppKeys';
import LessonStyle from '../common/constants/LessonStyle';
import { LessonScaffold } from '../components/LessonScaffold';
import { goalPresets, unitPresets } from '../model/DisplayPrefs';

@Component
export struct Settings {
  @StorageLink(AppKeys.UNITS) units: string = 'km';
  @StorageLink(AppKeys.HAPTICS) haptics: boolean = true;
  @StorageLink(AppKeys.DAILY_GOAL) dailyGoal: number = 5000;
  @StorageProp('languageCode') lang: string = 'en';

  build() {
    LessonScaffold({
      title: 'App-wide data',
      api: 'AppStorage · Environment',
      intro: 'Share values across pages, and read system info.',
      hint: 'Change units here, leave and come back — the value is kept.'
    }) {
      this.demo()
    }
  }

  @Builder
  private demo(): void {
    Column() {
      this.unitsCard()
      this.hapticsCard()
      this.goalCard()
      this.envCard()
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  private label(text: string, color: string): void {
    Text(text)
      .fontSize(11)
      .fontColor(color)
      .fontWeight(FontWeight.Medium)
      .margin({ bottom: 6 })
  }

  @Builder
  private unitsCard(): void {
    Column() {
      this.label('Units', LessonStyle.ACCENT)
      Text(this.units)
        .fontSize(14)
        .fontColor('#FFFFFF')
        .margin({ bottom: 8 })
      Button('Switch km / mi')
        .width('90%')
        .height(32)
        .fontSize(11)
        .fontColor('#000000')
        .backgroundColor(LessonStyle.ACCENT)
        .borderRadius(16)
        .onClick(() => {
          const next: number = (unitPresets.indexOf(this.units) + 1) % unitPresets.length;
          this.units = unitPresets[next];
        })
    }
    .width('88%')
    .padding(14)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }

  @Builder
  private hapticsCard(): void {
    Column() {
      this.label('Haptics', LessonStyle.ACCENT)
      Row() {
        Text(this.haptics ? 'On' : 'Off')
          .fontSize(14)
          .fontColor('#FFFFFF')
        Toggle({ type: ToggleType.Switch, isOn: this.haptics })
          .selectedColor(LessonStyle.ACCENT)
          .onChange((on: boolean) => this.haptics = on)
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('88%')
    .padding(14)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }

  @Builder
  private goalCard(): void {
    Column() {
      this.label('Daily goal', LessonStyle.ACCENT)
      Text(this.dailyGoal.toString())
        .fontSize(14)
        .fontColor('#FFFFFF')
        .margin({ bottom: 8 })
      Button('Next goal')
        .width('90%')
        .height(32)
        .fontSize(11)
        .fontColor('#000000')
        .backgroundColor(LessonStyle.ACCENT)
        .borderRadius(16)
        .onClick(() => {
          const idx: number = goalPresets.indexOf(this.dailyGoal);
          const next: number = (idx < 0 ? 0 : (idx + 1) % goalPresets.length);
          this.dailyGoal = goalPresets[next];
        })
    }
    .width('88%')
    .padding(14)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }

  @Builder
  private envCard(): void {
    Column() {
      this.label('System language', '#FFB300')
      Text(this.lang)
        .fontSize(14)
        .fontColor('#9E9E9E')
      Text('read-only')
        .fontSize(9)
        .fontColor('#6E6E6E')
        .margin({ top: 6 })
    }
    .width('88%')
    .padding(14)
    .borderRadius(18)
    .backgroundColor(LessonStyle.SURFACE)
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }
}
