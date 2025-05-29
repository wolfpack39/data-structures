import { Injectable, Type as Component } from '@angular/core';
import { SidenavContentAreaDirective } from './sidenav-content-area.directive';

@Injectable({
  providedIn: 'root'
})
export class SidenavService {

  isExpanded = false;
  active = false;

  #contentArea?: SidenavContentAreaDirective;
  #stack = [] as Component<unknown>[];

  isSlidingInFromRight = false;
  isSlidingInFromLeft = false;

  constructor() { }
  
  get sidenavTransitionDuration(): number {
    const sidenavTransitionCssVariable = getComputedStyle(
      document.body
    ).getPropertyValue('--sidenav-transition-duration');

    return parseInt(sidenavTransitionCssVariable, 10);
  }

  async #sleep(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }

  async #animateInFromLeft(): Promise<void> {
    this.isSlidingInFromLeft = true;
    await this.#sleep(this.sidenavTransitionDuration);
    this.isSlidingInFromLeft = false;
  }

  async #animateInFromRight(): Promise<void> {
    this.isSlidingInFromRight = true;
    await this.#sleep(this.sidenavTransitionDuration);
    this.isSlidingInFromRight = false;
  }

  setDynamicContentArea(host: SidenavContentAreaDirective) {
    this.#contentArea = host;
  }

  async push(component: Component<unknown>): Promise<void> {
    this.#stack.push(component);
    this.#setContent(component);

    await this.#animateInFromRight();

  }

  async pop(): Promise<void> {
    if (this.#stack.length === 1) {
      // At least one item must be in the stack
      // so user isn't left with an empty sidenav
      return;
    }

    this.#stack.pop();
    this.#setContent(this.#stack[this.#stack.length - 1]);

    await this.#animateInFromLeft()
  }

  #setContent(component: Component<unknown>): void {
    this.#contentArea?.viewContainerRef.clear();
    this.#contentArea?.viewContainerRef.createComponent(component);
  }

  toggle(): void {
    this.isExpanded = !this.isExpanded;
  }

  expandSidenav() {
    this.isExpanded = true;
  }

  collapseSidenav() {
    this.isExpanded = false;
  }

}
