import { NavigationService, Page } from '../navigation/NavigationService';
import { ThemeViewModel } from '../viewmodel/ThemeViewModel';
import { ShowcasePage } from './ShowcasePage';
import { ThemeType } from '../model/ThemeType';
import { themeRepository } from '../model/ThemeRepository';
import { ThemedButtonModifier } from '../modifiers/ThemedAttributeModifier';
import { ThemedDividerModifier } from '../modifiers/ThemedDividerModifier';
import { createThemedSymbol } from '../modifiers/ThemedSymbolFactory';
import { ArcList, ArcListItem, ComponentContent, LengthMetrics, CircleShape } from '@kit.ArkUI';

const WATCH_SIZE: string = '466px';

@Builder
function buildHomeHeader() {
  Column() {
    Text($r('app.string.home_title'))
      .fontSize(ThemeViewModel.getInstance().theme.titleFontSize)
      .fontWeight(ThemeViewModel.getInstance().theme.fontWeight)
      .fontColor(ThemeViewModel.getInstance().theme.textColor)
      .maxLines(1)
      .textOverflow({ overflow: TextOverflow.Ellipsis })
      .textAlign(TextAlign.Center)
      .width('100%')
  }
  .width('100%')
  .padding({ top: 20, bottom: 16 })
}

@Entry
@ComponentV2
struct Home {
  private nav: NavigationService = NavigationService.getInstance();
  private vm: ThemeViewModel = ThemeViewModel.getInstance();
  private headerContent: ComponentContent<Object> =
    new ComponentContent(this.getUIContext(), wrapBuilder(buildHomeHeader));

  @Builder
  destinationMap(name: string) {
    if (name === Page.SHOWCASE_PAGE) {
      ShowcasePage()
    }
  }

  build() {
    Navigation(this.nav.pageInfos) {
      Stack({ alignContent: Alignment.Center }) {
        Column()
          .width(WATCH_SIZE)
          .height(WATCH_SIZE)
          .clipShape(new CircleShape({ width: '100%', height: '100%' }))
          .backgroundColor(this.vm.theme.backgroundColor)

        ArcList({ initialIndex: 0, header: this.headerContent }) {
          ForEach(themeRepository.getAllTypes(), (type: ThemeType) => {
            ArcListItem() {
              Column({ space: 6 }) {
                if (this.vm.currentType === type) {
                  SymbolGlyph()
                    .attributeModifier(createThemedSymbol(themeRepository.getTheme(type)))
                }

                Button(themeRepository.getTheme(type).displayName)
                  .attributeModifier(new ThemedButtonModifier(this.vm.theme))
                  .width('78%')
                  .height(42)
                  .onClick(() => {
                    this.vm.setTheme(type);
                  })

                Button($r('app.string.menu_showcase'))
                  .attributeModifier(new ThemedButtonModifier(this.vm.theme))
                  .width('78%')
                  .height(38)
                  .onClick(() => {
                    this.vm.setTheme(type);
                    this.nav.navigateTo(Page.SHOWCASE_PAGE);
                  })

                // Show divider on every row except the last theme
                if (type !== ThemeType.Formal) {
                  Divider()
                    .attributeModifier(new ThemedDividerModifier(this.vm.theme))
                    .width('68%')
                    .margin({ top: 10, bottom: 2 })
                }
              }
              .width('100%')
              .justifyContent(FlexAlign.Center)
            }.align(Alignment.Center)
          }, (type: ThemeType) => type)

          ArcListItem() {
            Row().width('100%').height(40)
          }.align(Alignment.Center)
        }
        .scrollBar(BarState.Off)
        .space(LengthMetrics.px(16))
        .width(WATCH_SIZE)
        .height(WATCH_SIZE)
        .borderRadius(WATCH_SIZE)
      }
      .width('100%')
      .height('100%')
      .backgroundColor(this.vm.theme.backgroundColor)
    }
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .navDestination(this.destinationMap)
  }
}