import { Component, Input } from '@angular/core';
import { RouterLink, RouterLinkActive } from '@angular/router';
import { MatButton } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';

@Component({
  selector: 'app-sidenav-link',
  standalone: true,
  imports: [RouterLink, RouterLinkActive, MatButton, MatIcon],
  templateUrl: './sidenav-link.component.html',
  styleUrl: './sidenav-link.component.scss'
})
export class SidenavLinkComponent {
  @Input() routerLink = "";

}
