@ObservedV2
export class NavigationService {
  static _instance: NavigationService;
  @Trace pageInfos: NavPathStack = new NavPathStack();

  static getInstance(): NavigationService {
    if (!NavigationService._instance) {
      NavigationService._instance = new NavigationService();
    }
    return NavigationService._instance;
  }

  navigateTo(name: string): void {
    this.pageInfos.pushPath({ name: name });
  }
}

export enum Page {
  SHOWCASE_PAGE = 'ShowcasePage'
}