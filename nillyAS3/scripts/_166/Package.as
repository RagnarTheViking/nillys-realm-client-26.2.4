package _166
{
   import _f7.Signal;
   import com.company.assembleegameclient.util.TimeConversions;
   
   public class Package
   {
      
      public static const UNLIMITED:int = -1;
       
      
      private var _81:Boolean = false;
      
      public var _1gm:Signal;
      
      public var idSig:Signal;
      
      public var dateSig:Signal;
      
      public var timeLeftSig:Signal;
      
      public var nameSig:Signal;
      
      public var quantitySig:Signal;
      
      public var maxPurchaseSig:Signal;
      
      public var priceSig:Signal;
      
      public var _1__E_:Signal;
      
      private var _id:int;
      
      private var _date:Date;
      
      private var _name:String;
      
      private var _quantity:int;
      
      private var _maxPurchase:int;
      
      private var _price:int;
      
      private var _curType:int;
      
      private var _bgURL:String;
      
      private var _weight:int;
      
      private var _count:int;
      
      public function Package()
      {
         this._1gm = new Signal();
         this.idSig = new Signal(int);
         this.dateSig = new Signal(Date);
         this.timeLeftSig = new Signal(int);
         this.nameSig = new Signal(String);
         this.quantitySig = new Signal(int);
         this.maxPurchaseSig = new Signal(int);
         this.priceSig = new Signal(int);
         this._1__E_ = new Signal(String);
         super();
      }
      
      public function _do(param1:int, param2:Date, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:String, param10:int) : void
      {
         this._id = param1;
         this._date = param2;
         this._name = param3;
         this._quantity = param4;
         this._maxPurchase = param5;
         this._weight = param6;
         this._price = param7;
         this._curType = param8;
         this._bgURL = param9;
         this._count = param10;
         this._81 = true;
         this._1gm.dispatch();
      }
      
      public function timeLeft() : int
      {
         var _loc1_:Date = new Date();
         return this._date.time - _loc1_.time;
      }
      
      public function daysLeft() : Number
      {
         return Math.ceil(TimeConversions.secondsToDays(this.timeLeft() / 1000));
      }
      
      public function get quantity() : int
      {
         return this._quantity;
      }
      
      public function set quantity(param1:int) : void
      {
         this._quantity = param1;
         this.quantitySig.dispatch(param1);
      }
      
      public function get priority() : int
      {
         return this._weight;
      }
      
      public function set priority(param1:int) : void
      {
         this._weight = param1;
      }
      
      public function get packageID() : int
      {
         return this._id;
      }
      
      public function set packageID(param1:int) : void
      {
         this._id = param1;
         this.idSig.dispatch(param1);
      }
      
      public function get date() : Date
      {
         return this._date;
      }
      
      public function set date(param1:Date) : void
      {
         this._date = param1;
         this.dateSig.dispatch(param1);
         this.timeLeftSig.dispatch(this.timeLeft());
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
         this.nameSig.dispatch(param1);
      }
      
      public function get max() : int
      {
         return this._maxPurchase;
      }
      
      public function set max(param1:int) : void
      {
         this._maxPurchase = param1;
         this.maxPurchaseSig.dispatch(param1);
      }
      
      public function get price() : int
      {
         return this._price;
      }
      
      public function set price(param1:int) : void
      {
         this._price = param1;
         this.priceSig.dispatch(param1);
      }
      
      public function get curType() : int
      {
         return this._curType;
      }
      
      public function get bgURL() : String
      {
         return this._bgURL;
      }
      
      public function get numPurchased() : int
      {
         return this._count;
      }
      
      public function set numPurchased(param1:int) : void
      {
         this._count = param1;
      }
      
      public function available() : Boolean
      {
         return this._count > 0;
      }
      
      public function _1X_e() : Boolean
      {
         if(this.max == UNLIMITED)
         {
            return true;
         }
         return this._count < this._maxPurchase;
      }
      
      public function toString() : String
      {
         return "[Package name=" + this._name + ", packageId=" + this._id + "]";
      }
   }
}
