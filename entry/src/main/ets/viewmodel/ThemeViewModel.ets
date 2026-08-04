import { ThemeType } from '../model/ThemeType';
import { ThemeDefinition } from '../model/ThemeDefinition';
import { themeRepository } from '../model/ThemeRepository';

@ObservedV2
export class ThemeViewModel {
  private static _instance: ThemeViewModel;
  @Trace currentType: ThemeType = ThemeType.Sport;

  static getInstance(): ThemeViewModel {
    if (!ThemeViewModel._instance) {
      ThemeViewModel._instance = new ThemeViewModel();
    }
    return ThemeViewModel._instance;
  }

  get theme(): ThemeDefinition {
    return themeRepository.getTheme(this.currentType);
  }

  setTheme(type: ThemeType): void {
    this.currentType = type;
  }

  cycleTheme(): void {
    const all: ThemeType[] = themeRepository.getAllTypes();
    const next: number = (all.indexOf(this.currentType) + 1) % all.length;
    this.currentType = all[next];
  }
}