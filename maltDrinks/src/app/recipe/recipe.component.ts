import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { DataService } from '../data-service.service';

@Component({
  selector: 'app-recipe',
  templateUrl: './recipe.component.html',
  styleUrls: ['./recipe.component.css']
})
export class RecipeComponent {
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
}
