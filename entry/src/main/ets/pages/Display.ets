import { PersistenceV2 } from '@kit.ArkUI';
import AppKeys from '../common/constants/AppKeys';
import { LabCard } from '../components/LabCard';
import { LessonScaffoldV2 } from '../components/LessonScaffoldV2';
import { AccentOption, accentPalette, DisplayPrefs, unitPresets, watchFacePresets } from '../model/DisplayPrefs';
import { connectDisplayPrefs, resetDisplayPrefs } from '../model/persistence';
@ComponentV2
export struct Display {
  @Local prefs: DisplayPrefs = connectDisplayPrefs();
  // tick exists because PersistenceV2.keys() is non-reactive; reads of it drive savedStatus recompute.
  @Local tick: number = 0;

  aboutToAppear(): void {
    this.mirrorAccent();
  }

  build() {
    LessonScaffoldV2({
      title: 'Persist state',
      api: 'PersistenceV2',
      intro: 'Saves UI state to the device so it survives an app restart.',
      hint: "Change a value, fully close the app, reopen — it's still here."
    }) {
      this.demo()
    }
  }

  private accent(): string {
    const opt: AccentOption = accentPalette[this.prefs.accentIndex];
    return opt.color;
  }

  private mirrorAccent(): void {
    AppStorage.setOrCreate<string>(AppKeys.ACCENT, this.accent());
  }

  private savedStatus(): string {
    const stored: boolean = this.tick >= 0 && PersistenceV2.keys().length > 0;
    return stored ? 'Saved to device ✓' : 'Cleared';
  }

  @Builder
  private demo(): void {
    Column() {
      LabCard({ title: 'Theme', accent: this.accent() }) {
        this.accentBody()
      }

      LabCard({ title: 'Units (km / mi)', accent: this.accent() }) {
        this.unitsBody()
      }

      LabCard({ title: 'Watch face', accent: this.accent() }) {
        this.faceBody()
      }

      LabCard({ title: 'Status', accent: this.accent() }) {
        this.statusBody()
      }

      Button('Reset to defaults')
        .width('80%')
        .height(38)
        .fontSize(13)
        .fontColor('#FFFFFF')
        .backgroundColor('#3A2326')
        .borderRadius(20)
        .margin({ top: 4 })
        .onClick(() => {
          this.prefs = resetDisplayPrefs();
          this.mirrorAccent();
          this.tick++;
        })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  private accentBody(): void {
    Text(accentPalette[this.prefs.accentIndex].name)
      .fontSize(14)
      .fontColor('#FFFFFF')
      .margin({ bottom: 8 })
    Button('Next theme')
      .width('90%')
      .height(34)
      .fontSize(12)
      .fontColor('#000000')
      .backgroundColor(this.accent())
      .borderRadius(18)
      .onClick(() => {
        this.prefs.accentIndex = (this.prefs.accentIndex + 1) % accentPalette.length;
        this.mirrorAccent();
        this.tick++;
      })
  }

  @Builder
  private unitsBody(): void {
    Text(unitPresets[this.prefs.unitIndex])
      .fontSize(14)
      .fontColor('#FFFFFF')
      .margin({ bottom: 8 })
    Button('Switch units')
      .width('90%')
      .height(34)
      .fontSize(12)
      .fontColor('#FFFFFF')
      .backgroundColor('#2C2C2E')
      .borderRadius(18)
      .onClick(() => {
        this.prefs.unitIndex = (this.prefs.unitIndex + 1) % unitPresets.length;
        this.tick++;
      })
  }

  @Builder
  private faceBody(): void {
    Text(this.prefs.face.label)
      .fontSize(14)
      .fontColor('#FFFFFF')
      .margin({ bottom: 8 })
    Button('Next face')
      .width('90%')
      .height(34)
      .fontSize(12)
      .fontColor('#FFFFFF')
      .backgroundColor('#2C2C2E')
      .borderRadius(18)
      .onClick(() => {
        const next: number = (watchFacePresets.indexOf(this.prefs.face.label) + 1) % watchFacePresets.length;
        this.prefs.face.label = watchFacePresets[next];
        this.tick++;
      })
  }

  @Builder
  private statusBody(): void {
    Text(this.savedStatus())
      .fontSize(13)
      .fontColor('#FFFFFF')
      .textAlign(TextAlign.Center)
      .width('100%')
  }
}
