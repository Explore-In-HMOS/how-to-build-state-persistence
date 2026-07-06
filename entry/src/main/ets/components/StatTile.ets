@Component
export struct StatTile {
  @Prop reps: number = 0;

  build() {
    Column() {
      Text(`${this.reps} reps`)
        .fontSize(14)
        .fontColor('#FFFFFF')
        .margin({ bottom: 8 })
      Button('+1')
        .width('90%')
        .height(32)
        .fontSize(11)
        .fontColor('#000000')
        .backgroundColor('#FFB300')
        .borderRadius(16)
        .onClick(() => this.reps++)
      Text('Changes here stay local')
        .fontSize(9)
        .fontColor('#9E9E9E')
        .margin({ top: 6 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
