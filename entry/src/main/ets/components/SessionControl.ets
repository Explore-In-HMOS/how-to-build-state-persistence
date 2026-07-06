@Component
export struct SessionControl {
  @Link intensity: number;

  build() {
    Column() {
      Row() {
        Button('-')
          .width(44)
          .height(32)
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#2C2C2E')
          .borderRadius(16)
          .onClick(() => {
            if (this.intensity > 0) {
              this.intensity--;
            }
          })
        Text(this.intensity.toString())
          .fontSize(16)
          .fontColor('#FFFFFF')
          .width(48)
          .textAlign(TextAlign.Center)
        Button('+')
          .width(44)
          .height(32)
          .fontSize(16)
          .fontColor('#000000')
          .backgroundColor('#26C6DA')
          .borderRadius(16)
          .onClick(() => {
            if (this.intensity < 10) {
              this.intensity++;
            }
          })
      }

      Text('Changes here update the parent above')
        .fontSize(9)
        .fontColor('#9E9E9E')
        .margin({ top: 6 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
