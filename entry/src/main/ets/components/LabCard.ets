@ComponentV2
export struct LabCard {
  @Param @Require title: string = '';
  @Param @Require accent: string = '#26C6DA';
  @BuilderParam content: () => void = this.emptyContent;

  @Builder
  emptyContent(): void {
  }

  build() {
    Column() {
      Text(this.title)
        .fontSize(12)
        .fontColor(this.accent)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 8 })
        .textAlign(TextAlign.Center)
        .width('100%')

      this.content()
    }
    .width('88%')
    .padding({
      top: 14,
      bottom: 14,
      left: 16,
      right: 16
    })
    .borderRadius(18)
    .backgroundColor('#1C1C1E')
    .alignItems(HorizontalAlign.Center)
    .margin({ bottom: 12 })
  }
}
