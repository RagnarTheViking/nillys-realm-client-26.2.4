package _1y1
{
   import _0pN_._049;
   import flash.utils.Timer;
   import _aW_.IWebRequest;
   import _4u.Account;
   import _1__8._19A_;
   import _03U_._51;
   import flash.events.TimerEvent;
   import _166.Package;
   
   public class _I_Y_ extends _049
   {
      
      private static const _13Q_:int = 1000 * 60 * 60;
       
      
      public var timer:Timer;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _F_D_:_1y1._al;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var _jk:_51;
      
      public function _I_Y_()
      {
         this.timer = new Timer(_13Q_);
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:Object = this.account.credentials();
         _loc1_.language = this._jk._lP_();
         this.client.sendRequest("/package/getPackages",_loc1_);
         this.client.complete.addOnce(this.onComplete);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._0r__(param2);
         }
         else
         {
            this._0G_2._0G_b("GetPackageTask.onComplete: Request failed.");
            _0et(false);
         }
      }
      
      private function _0r__(param1:*) : void
      {
         var _loc2_:XML = null;
         if(this._1D_X_(param1))
         {
            this._0G_2.info("GetPackageTask.onComplete: No package available, retrying in 1 hour.");
            this.timer.addEventListener(TimerEvent.TIMER,this._W_f);
            this.timer.start();
            this._F_D_._1i__([]);
         }
         else
         {
            _loc2_ = XML(param1);
            this.parse(_loc2_);
         }
         _0et(true);
      }
      
      private function _1D_X_(param1:*) : Boolean
      {
         var _loc2_:XMLList = XML(param1).Packages;
         return _loc2_.length() == 0;
      }
      
      private function parse(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Date = null;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:Package = null;
         var _loc14_:Array = [];
         for each(_loc2_ in param1.Packages.Package)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = String(_loc2_.Name);
            _loc5_ = int(_loc2_.Price);
            _loc6_ = int(_loc2_.Price.@currency);
            _loc7_ = int(_loc2_.Quantity);
            _loc8_ = int(_loc2_.MaxPurchase);
            _loc9_ = int(_loc2_.Weight);
            _loc10_ = new Date(String(_loc2_.EndDate));
            _loc11_ = String(_loc2_.BgURL);
            _loc12_ = this.getPurchaseCount(param1,_loc3_);
            _loc13_ = new Package();
            _loc13_._do(_loc3_,_loc10_,_loc4_,_loc7_,_loc8_,_loc9_,_loc5_,_loc6_,_loc11_,_loc12_);
            _loc14_.push(_loc13_);
         }
         this._F_D_._1i__(_loc14_);
      }
      
      private function getPurchaseCount(param1:XML, param2:int) : int
      {
         var packageHistory:XMLList = null;
         var numPurchased:int = 0;
         var packagesXML:XML = param1;
         var packageID:int = param2;
         var history:XMLList = packagesXML.History;
         if(history)
         {
            packageHistory = history.Package.(@id == packageID);
            if(packageHistory)
            {
               numPurchased = int(packageHistory.Count);
            }
         }
         return numPurchased;
      }
      
      private function _W_f(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this._W_f);
         this.timer.stop();
         this.startTask();
      }
   }
}
