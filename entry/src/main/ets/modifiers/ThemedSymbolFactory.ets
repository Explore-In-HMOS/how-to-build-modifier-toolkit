import { SymbolGlyphModifier } from '@kit.ArkUI';
import { ThemeDefinition } from '../model/ThemeDefinition';

export function createThemedSymbol(theme: ThemeDefinition): SymbolGlyphModifier {
  return new SymbolGlyphModifier(theme.symbolName)
    .fontColor([theme.symbolColor])
    .fontSize(theme.titleFontSize)
    .fontWeight(theme.symbolFontWeight);
}