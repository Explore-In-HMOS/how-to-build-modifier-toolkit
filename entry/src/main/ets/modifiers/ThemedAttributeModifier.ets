import { ThemeDefinition } from '../model/ThemeDefinition';

export class ThemedButtonModifier implements AttributeModifier<ButtonAttribute> {
  theme: ThemeDefinition;

  constructor(theme: ThemeDefinition) {
    this.theme = theme;
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor(this.theme.surfaceColor);
    instance.fontColor(this.theme.textColor);
    instance.fontSize(this.theme.bodyFontSize);
    instance.fontWeight(this.theme.fontWeight);
    instance.borderRadius(this.theme.cornerRadius);
  }

  applyPressedAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor(this.theme.pressedColor);
  }
}