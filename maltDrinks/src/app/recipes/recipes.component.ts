import { Component } from '@angular/core';
import { DataService } from '../data-service.service';

@Component({
  selector: 'app-recipes',
  templateUrl: './recipes.component.html',
  styleUrls: ['./recipes.component.css']
})
export class RecipesComponent {
  recipes = []

  constructor(private dataService : DataService){
    const manufacturer = JSON.parse(window.sessionStorage.getItem("manufacturer_id")!)
    this.dataService.getRecipes(manufacturer).subscribe((response)=>{
      this.recipes = response
      console.log(response)
    })
  }
}
