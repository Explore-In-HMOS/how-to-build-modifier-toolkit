export class ThemedGestureModifier implements GestureModifier {
  private onSwipe: () => void;

  constructor(onSwipe: () => void) {
    this.onSwipe = onSwipe;
  }

  applyGesture(event: UIGestureEvent): void {
    event.addGesture(
      new PanGestureHandler({ direction: PanDirection.Horizontal })
        .onActionEnd(() => {
          this.onSwipe();
        })
    );
  }
}