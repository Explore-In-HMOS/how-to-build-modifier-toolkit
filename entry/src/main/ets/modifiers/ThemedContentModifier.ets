import { ThemeDefinition } from '../model/ThemeDefinition';


export class ThemedContentModifier implements ContentModifier<GaugeConfiguration> {
  theme: ThemeDefinition;

  constructor(theme: ThemeDefinition) {
    this.theme = theme;
  }

  applyContent(): WrappedBuilder<[GaugeConfiguration]> {
    return wrapBuilder(buildThemedGauge);
  }
}

@Builder
function buildThemedGauge(config: GaugeConfiguration) {
  Stack() {
    Progress({
      value: config.value,
      total: config.max,
      type: ProgressType.Ring
    })
      .color((config.contentModifier as ThemedContentModifier).theme.accentColor)
      .backgroundColor((config.contentModifier as ThemedContentModifier).theme.surfaceColor)
      .width('100%')
      .height('100%')

    Text(`${Math.round(config.value)}`)
      .fontColor((config.contentModifier as ThemedContentModifier).theme.textColor)
      .fontSize((config.contentModifier as ThemedContentModifier).theme.titleFontSize)
      .fontWeight((config.contentModifier as ThemedContentModifier).theme.fontWeight)
  }
  .width('100%')
  .height('100%')
}