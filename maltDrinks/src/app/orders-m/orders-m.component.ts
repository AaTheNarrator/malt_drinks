import { Component } from '@angular/core';
import { DataService } from '../data-service.service';

@Component({
  selector: 'app-orders-m',
  templateUrl: './orders-m.component.html',
  styleUrls: ['./orders-m.component.css']
})
export class OrdersMComponent {
    orders : any = []

    constructor(private dataService : DataService){
      const id = JSON.parse(window.sessionStorage.getItem("manufacturer_id")!).manufacturer_id
      console.log(id)
      this.dataService.getOrdersForManufacturer(id).subscribe((response)=>{
        this.orders = response
        console.log(response)
      })
    }
}
