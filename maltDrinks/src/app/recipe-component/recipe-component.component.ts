import { Component, Input, OnInit  } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { DataService } from '../data-service.service';

@Component({
  selector: 'app-recipe-component',
  templateUrl: './recipe-component.component.html',
  styleUrls: ['./recipe-component.component.css']
})
export class RecipeComponentComponent {
  @Input() product : any
  productId = ""

  constructor(private route: ActivatedRoute,
    private dataService : DataService){
      this.route.paramMap.subscribe(params =>{
      this.productId = "" + params.get('id')
    })
  }

  ngOnInit(){
    this.product.amount_product = Number(this.product.amount_product.split(' ')[0]);
  }
  
  save(){
    let obj = {
      "recipe_id" : this.productId,
      "product_id" : this.product.product_id,
      "amount_product" : this.product.amount_product
    }

    this.dataService.updateProductRecipe(obj)
  }
}
