import { drawing } from '@kit.ArkGraphics2D';
import { DrawStyle } from '../model/ThemeDefinition';

export class ThemedDrawModifier extends DrawModifier {
  private uiContext: UIContext;
  private style: DrawStyle = DrawStyle.None;
  private colorValue: number = 0xFF000000;

  constructor(uiContext: UIContext, style: DrawStyle, colorValue: number) {
    super();
    this.uiContext = uiContext;
    this.style = style;
    this.colorValue = colorValue;
  }

  private themedBrush(): drawing.Brush {
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: (this.colorValue >>> 24) & 0xFF,
      red: (this.colorValue >>> 16) & 0xFF,
      green: (this.colorValue >>> 8) & 0xFF,
      blue: this.colorValue & 0xFF
    });
    return brush;
  }

  // Sport: diagonal-like vertical stripes behind the surface.
  drawBehind(context: DrawContext): void {
    if (this.style !== DrawStyle.Stripes) {
      return;
    }
    context.canvas.attachBrush(this.themedBrush());
    const w = context.size.width;
    const h = context.size.height;
    const step = 24;
    for (let x = 0; x < w; x += step) {
      context.canvas.drawRect({
        left: this.uiContext.vp2px(x),
        top: this.uiContext.vp2px(0),
        right: this.uiContext.vp2px(x + 6),
        bottom: this.uiContext.vp2px(h)
      });
    }
    context.canvas.detachBrush();
  }

  // Formal: thin frame over the surface (four edge rects).
  drawForeground(context: DrawContext): void {
    if (this.style !== DrawStyle.Frame) {
      return;
    }
    context.canvas.attachBrush(this.themedBrush());
    const w = context.size.width;
    const h = context.size.height;
    const t = 1.5;

    context.canvas.drawRect({
      left: this.uiContext.vp2px(0),
      top: this.uiContext.vp2px(0),
      right: this.uiContext.vp2px(w),
      bottom: this.uiContext.vp2px(t)
    });
    context.canvas.drawRect({
      left: this.uiContext.vp2px(0),
      top: this.uiContext.vp2px(h - t),
      right: this.uiContext.vp2px(w),
      bottom: this.uiContext.vp2px(h)
    });
    context.canvas.drawRect({
      left: this.uiContext.vp2px(0),
      top: this.uiContext.vp2px(0),
      right: this.uiContext.vp2px(t),
      bottom: this.uiContext.vp2px(h)
    });
    context.canvas.drawRect({
      left: this.uiContext.vp2px(w - t),
      top: this.uiContext.vp2px(0),
      right: this.uiContext.vp2px(w),
      bottom: this.uiContext.vp2px(h)
    });
    context.canvas.detachBrush();
  }
}