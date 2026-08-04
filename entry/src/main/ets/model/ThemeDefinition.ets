import { ThemeType } from './ThemeType';

export enum DrawStyle {
  Stripes,
  Frame,
  None
}

export interface ThemeDefinition {
  type: ThemeType;
  displayName: Resource;

  // Attribute Modifier
  backgroundColor: Resource;
  surfaceColor: Resource;
  textColor: Resource;
  accentColor: Resource;
  pressedColor: Resource;
  cornerRadius: number;
  titleFontSize: number;
  bodyFontSize: number;
  fontWeight: FontWeight;
  captionFontSize: number;

  // Divider Modifier
  dividerColor: Resource;
  dividerStrokeWidth: number;

  // Symbol Glyph Modifier
  symbolColor: Resource;
  symbolFontWeight: FontWeight;
  symbolName: Resource;

  // Draw Modifier
  drawStyle: DrawStyle;
  drawColorValue: number;
}