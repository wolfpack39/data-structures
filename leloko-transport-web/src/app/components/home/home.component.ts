import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CardComponent } from "../../utils/card/card.component";

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [RouterOutlet, CardComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {

  completedTrips = [];
  assignedTrips = [];
  tripRequests = [];
  
}
