import { ThemeDefinition } from '../model/ThemeDefinition';

export class ThemedDividerModifier implements AttributeModifier<DividerAttribute> {
  theme: ThemeDefinition;

  constructor(theme: ThemeDefinition) {
    this.theme = theme;
  }

  applyNormalAttribute(instance: DividerAttribute): void {
    instance.color(this.theme.dividerColor);
    instance.strokeWidth(this.theme.dividerStrokeWidth);
  }
}