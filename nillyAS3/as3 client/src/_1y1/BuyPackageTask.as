package _1y1
{
   import _0pN_._049;
   import _aW_.IWebRequest;
   import _4u.Account;
   import _v4.Client;
   import com.company.assembleegameclient.map._1mU_;
   import _166.Package;
   import _0pn._17T_;
   import _ge._v1;
   import _C_._1O_I_;
   
   public class BuyPackageTask extends _049
   {
      
      private static const _14H_:Array = ["Package is not Available","Package is not Available Right Now","Invalid PackageId"];
       
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _0v9:_1y1._I_Y_;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _nE_:_1mU_;
      
      [Inject]
      public var pkg:Package;
      
      [Inject]
      public var _mi:_17T_;
      
      [Inject]
      public var go:_v1;
      
      public function BuyPackageTask()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:Object = this.account.credentials();
         _loc1_.packageId = this.pkg.packageID;
         this.updateCurrency(-this.pkg.price);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/purchasePackage",_loc1_);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         var _loc3_:XML = new XML(param2);
         if(param1)
         {
            this._0C_v(_loc3_);
         }
         else
         {
            this._hS_(_loc3_);
         }
         _0et(true,param2);
      }
      
      private function _0C_v(param1:XML) : void
      {
         if(this.pkg.quantity != Package.UNLIMITED)
         {
            this.pkg.quantity--;
         }
         this.pkg.numPurchased++;
         this._nE_.dispatch(_1O_I_._1C_B_,11495650);
         this._mi.dispatch();
         if(this.pkg.quantity <= 0)
         {
            this._0v9.start();
         }
      }
      
      private function _hS_(param1:XML) : void
      {
         this.updateCurrency(this.pkg.price);
         this._1u2(param1[0]);
      }
      
      private function _1u2(param1:String) : void
      {
         this._nE_.dispatch(param1,16744576);
         if(_14H_.indexOf(param1) != -1)
         {
            this._0v9.start();
         }
      }
      
      private function updateCurrency(param1:int) : void
      {
         switch(this.pkg.curType)
         {
            case 0:
               this._0U_H_.UpdateCredits(param1);
               break;
            case 1:
               this._0U_H_.UpdateFame(param1);
               break;
            case 2:
               this._0U_H_.UpdateTokens(param1);
         }
      }
   }
}
