import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-each-recipe',
  templateUrl: './each-recipe.component.html',
  styleUrls: ['./each-recipe.component.css']
})
export class EachRecipeComponent {
@Input() product : any
}
