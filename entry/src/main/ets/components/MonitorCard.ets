import AppKeys from '../common/constants/AppKeys';
import { accentPalette, DisplayPrefs } from '../model/DisplayPrefs';
import { connectDisplayPrefs } from '../model/persistence';

@ComponentV2
export struct MonitorCard {
  @Local prefs: DisplayPrefs = connectDisplayPrefs();
  @Local derived: string = accentPalette[0].name;

  @Monitor('prefs.accentIndex')
  onAccentChange() {
    this.derived = accentPalette[this.prefs.accentIndex].name;
    AppStorage.setOrCreate<string>(AppKeys.ACCENT, accentPalette[this.prefs.accentIndex].color);
  }

  build() {
    Column() {
      Text(`Theme: ${this.derived}`)
        .fontSize(14)
        .fontColor('#FFFFFF')
        .margin({ bottom: 2 })
      Text('This card updates itself when the theme changes.')
        .fontSize(9)
        .fontColor('#9E9E9E')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 8 })
      Button('Change theme')
        .width('90%')
        .height(32)
        .fontSize(11)
        .fontColor('#000000')
        .backgroundColor(this.accent())
        .borderRadius(16)
        .onClick(() => {
          this.prefs.accentIndex = (this.prefs.accentIndex + 1) % accentPalette.length;
        })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  private accent(): string {
    return accentPalette[this.prefs.accentIndex].color;
  }
}
