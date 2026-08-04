import { ThemeViewModel } from '../viewmodel/ThemeViewModel';
import { ThemedContentModifier } from '../modifiers/ThemedContentModifier';
import { ThemedCard } from '../components/ThemedCard';
import { ThemedGestureModifier } from '../modifiers/ThemedGestureModifier';
import { WatchSpacing } from '../model/WatchSpacing';

@ComponentV2
export struct ShowcasePage {
  private vm: ThemeViewModel = ThemeViewModel.getInstance();

  // Swipe on the gesture demo area cycles through themes.
  private themeGestureModifier: ThemedGestureModifier =
    new ThemedGestureModifier(() => {
      this.vm.cycleTheme();
    });

  @Builder
  sectionLabel(text: ResourceStr) {
    Text(text)
      .fontSize(this.vm.theme.captionFontSize)
      .fontColor(this.vm.theme.textColor)
      .opacity(0.6)
      .width('100%')
      .textAlign(TextAlign.Center)
  }

  build() {
    NavDestination() {
      Scroll() {
        Column({ space: WatchSpacing.sectionGap }) {
          Text($r('app.string.showcase_title'))
            .fontSize(this.vm.theme.titleFontSize)
            .fontWeight(this.vm.theme.fontWeight)
            .fontColor(this.vm.theme.textColor)
            .width('100%')
            .textAlign(TextAlign.Center)

          Text(this.vm.theme.displayName)
            .fontSize(this.vm.theme.captionFontSize)
            .fontColor(this.vm.theme.textColor)
            .opacity(0.7)
            .width('100%')
            .textAlign(TextAlign.Center)

          // Content Modifier: themed Gauge content area
          Column({ space: WatchSpacing.textGap }) {
            this.sectionLabel($r('app.string.label_content'))
            Gauge({ value: 65, min: 0, max: 100 })
              .contentModifier(new ThemedContentModifier(this.vm.theme))
              .width(100)
              .height(100)
          }
          .width('100%')

          // Draw Modifier: themed surface with custom drawing
          Column({ space: WatchSpacing.textGap }) {
            this.sectionLabel($r('app.string.label_draw'))
            ThemedCard({ theme: this.vm.theme })
              .width('78%')
              .height(70)
          }
          .width('100%')

          // Gesture Modifier: horizontal swipe cycles themes
          Column({ space: WatchSpacing.textGap }) {
            this.sectionLabel($r('app.string.label_gesture'))
            Column() {
              Text($r('app.string.gesture_hint'))
                .fontSize(this.vm.theme.captionFontSize)
                .fontColor(this.vm.theme.textColor)
                .textAlign(TextAlign.Center)
                .width('100%')
            }
            .width('78%')
            .height(50)
            .justifyContent(FlexAlign.Center)
            .backgroundColor(this.vm.theme.surfaceColor)
            .borderRadius(this.vm.theme.cornerRadius)
            .gestureModifier(this.themeGestureModifier)
          }
          .width('100%')
        }
        .width('100%')
        .constraintSize({ minHeight: '100%' })
        .justifyContent(FlexAlign.Center)
        .padding({
          left: WatchSpacing.edgeHorizontal,
          right: WatchSpacing.edgeHorizontal,
          top: WatchSpacing.edgeTop,
          bottom: WatchSpacing.edgeBottomLarge
        })
      }
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .hideTitleBar(true)
    .backgroundColor(this.vm.theme.backgroundColor)
  }
}