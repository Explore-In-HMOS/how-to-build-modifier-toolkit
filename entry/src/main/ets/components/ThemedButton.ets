import { ThemedButtonModifier } from '../modifiers/ThemedAttributeModifier';
import { ThemeDefinition } from '../model/ThemeDefinition';

@ComponentV2
export struct ThemedButton {
  @Require @Param theme: ThemeDefinition;
  @Require @Param label: ResourceStr;
  @Param onTap: () => void = () => {};

  @Local btnModifier: ThemedButtonModifier = new ThemedButtonModifier(this.theme);

  @Monitor('theme')
  onThemeChange(): void {
    this.btnModifier = new ThemedButtonModifier(this.theme);
  }

  build() {
    Button(this.label)
      .attributeModifier(this.btnModifier)
      .width('100%')
      .onClick(() => {
        this.onTap();
      })
  }
}