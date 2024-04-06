import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { DataService } from '../data-service.service';

@Component({
  selector: 'app-recipe-page',
  templateUrl: './recipe-page.component.html',
  styleUrls: ['./recipe-page.component.css']
})
export class RecipePageComponent {
  productId = ""
  dataOfProduct : any

  constructor(private route: ActivatedRoute,
              private dataService : DataService){
      this.route.paramMap.subscribe(params =>{
          this.productId = "" + params.get('id')
          this.dataService.getAllInfoForProductById(this.productId).subscribe({
              next: response =>{
              this.dataOfProduct = response
              },
              error: error => {
                  console.error('Ошибка при выполнении запроса:', error);
              }
          })
      })
  }

  save(){
    let obj = {
      "name" : this.dataOfProduct.product_name,
      "description" : this.dataOfProduct.description,
      "recipe_id" : this.productId,
    }

    this.dataService.updateRecipe(obj)
  }
}
