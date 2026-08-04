import { ThemeType } from './ThemeType';
import { ThemeDefinition, DrawStyle } from './ThemeDefinition';

class ThemeRepositoryImpl {
  private readonly themes: Map<ThemeType, ThemeDefinition> = new Map();

  constructor() {
    this.themes.set(ThemeType.Sport, {
      type: ThemeType.Sport,
      displayName: $r('app.string.theme_sport'),
      backgroundColor: $r('app.color.sport_bg'),
      surfaceColor: $r('app.color.sport_surface'),
      textColor: $r('app.color.sport_text'),
      accentColor: $r('app.color.sport_accent'),
      pressedColor: $r('app.color.sport_pressed'),
      cornerRadius: 8,
      titleFontSize: 17,
      bodyFontSize: 15,
      fontWeight: FontWeight.Bold,
      dividerColor: $r('app.color.sport_divider'),
      dividerStrokeWidth: 2,
      symbolColor: $r('app.color.sport_accent'),
      symbolFontWeight: FontWeight.Bold,
      drawStyle: DrawStyle.Stripes,
      drawColorValue: 0xFFFF6D00,
      captionFontSize: 12,
      symbolName: $r('sys.symbol.ohos_wifi')
    });

    this.themes.set(ThemeType.Casual, {
      type: ThemeType.Casual,
      displayName: $r('app.string.theme_casual'),
      backgroundColor: $r('app.color.casual_bg'),
      surfaceColor: $r('app.color.casual_surface'),
      textColor: $r('app.color.casual_text'),
      accentColor: $r('app.color.casual_accent'),
      pressedColor: $r('app.color.casual_pressed'),
      cornerRadius: 16,
      titleFontSize: 16,
      bodyFontSize: 15,
      fontWeight: FontWeight.Medium,
      dividerColor: $r('app.color.casual_divider'),
      dividerStrokeWidth: 1,
      symbolColor: $r('app.color.casual_accent'),
      symbolFontWeight: FontWeight.Medium,
      drawStyle: DrawStyle.None,
      drawColorValue: 0xFF2AA198,
      captionFontSize: 12,
      symbolName: $r('sys.symbol.ohos_lungs')
    });

    this.themes.set(ThemeType.Formal, {
      type: ThemeType.Formal,
      displayName: $r('app.string.theme_formal'),
      backgroundColor: $r('app.color.formal_bg'),
      surfaceColor: $r('app.color.formal_surface'),
      textColor: $r('app.color.formal_text'),
      accentColor: $r('app.color.formal_accent'),
      pressedColor: $r('app.color.formal_pressed'),
      cornerRadius: 4,
      titleFontSize: 16,
      bodyFontSize: 14,
      fontWeight: FontWeight.Regular,
      dividerColor: $r('app.color.formal_divider'),
      dividerStrokeWidth: 1,
      symbolColor: $r('app.color.formal_accent'),
      symbolFontWeight: FontWeight.Regular,
      drawStyle: DrawStyle.Frame,
      drawColorValue: 0xFFC9A24B,
      captionFontSize: 11,
      symbolName: $r('sys.symbol.trash')
    });
  }

  getTheme(type: ThemeType): ThemeDefinition {
    return this.themes.get(type)!;
  }

  getAllTypes(): ThemeType[] {
    return [ThemeType.Sport, ThemeType.Casual, ThemeType.Formal];
  }
}

export const themeRepository: ThemeRepositoryImpl = new ThemeRepositoryImpl();