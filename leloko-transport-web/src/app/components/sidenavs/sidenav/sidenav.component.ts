import { Component, ElementRef, HostBinding, HostListener, ViewChild } from '@angular/core';
import { SidenavService } from './sidenav.service';
import { SidenavContentAreaDirective } from './sidenav-content-area.directive';
import { MatIcon } from '@angular/material/icon';

@Component({
  selector: 'app-sidenav',
  standalone: true,
  imports: [SidenavContentAreaDirective, MatIcon],
  templateUrl: './sidenav.component.html',
  styleUrl: './sidenav.component.scss',
  
})
export class SidenavComponent {

  @ViewChild(SidenavContentAreaDirective, { static: true })
  sidenavContentArea?: SidenavContentAreaDirective;

  constructor(public sidenavService: SidenavService, private elementRef: ElementRef) {}

  ngOnInit(): void {
    if (!this.sidenavContentArea) {
      throw new Error('Sidenav content area is undefined');
    }

    this.sidenavService.setDynamicContentArea(this.sidenavContentArea);
  }

  @HostBinding('class.is-expanded')
  get isExpanded() {
    return this.sidenavService.isExpanded;
  }

}
