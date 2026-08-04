import { ThemedDrawModifier } from '../modifiers/ThemedDrawModifier';
import { ThemeDefinition } from '../model/ThemeDefinition';

@ComponentV2
export struct ThemedCard {
  @Require @Param theme: ThemeDefinition;
  @Local cardDrawModifier: ThemedDrawModifier | undefined = undefined;

  aboutToAppear(): void {
    this.rebuildModifier();
  }

  @Monitor('theme')
  onThemeChange(): void {
    this.rebuildModifier();
  }

  private rebuildModifier(): void {
    this.cardDrawModifier = new ThemedDrawModifier(
      this.getUIContext(),
      this.theme.drawStyle,
      this.theme.drawColorValue
    );
  }

  build() {
    Column()
      .width('100%')
      .height('100%')
      .backgroundColor(this.theme.surfaceColor)
      .borderRadius(this.theme.cornerRadius)
      .drawModifier(this.cardDrawModifier)
  }
}