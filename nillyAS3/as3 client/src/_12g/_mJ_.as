package _12g
{
   import flash.system.Security;
   import flash.net.LocalConnection;
   import _009._1G_z;
   
   public class _mJ_
   {
       
      
      private const _1us:String = "localhost";
      
      private const _O_1:Array = [_1G_z._06k(-387,-136),"realmofthemadgod.appspot.com"];
      
      private const _1P_Q_:Array = [_1G_z._06k(-386,-137),"rotmgtesting.appspot.com",WebMain.pserverHost];
      
      private const _1D_s:Array = ["rotmgbbtesting.appspot.com"];
      
      private const _G_a:Array = ["xlate.kabam.com"];
      
      private const _wu:Array = _O_1.concat(_1P_Q_).concat(_G_a).concat(_1D_s);
      
      [Inject]
      public var client:_12g._1T_d;
      
      private var _109:String;
      
      public function _mJ_()
      {
         super();
      }
      
      public function _X_S_() : void
      {
         var _loc1_:String = null;
         for each(_loc1_ in this._wu)
         {
            Security.allowDomain(_loc1_);
         }
      }
      
      public function _rs() : Boolean
      {
         return this.client._W_G_() || this._0I_4();
      }
      
      public function _1wX_() : Boolean
      {
         var _loc1_:String = this._1bV_();
         return this._O_1.indexOf(_loc1_) != -1;
      }
      
      private function _0I_4() : Boolean
      {
         var _loc1_:String = null;
         var _loc2_:String = this._1bV_();
         var _loc3_:* = _loc2_ == this._1us;
         for each(_loc1_ in this._wu)
         {
            _loc3_ = _loc3_ || _loc2_ == _loc1_;
         }
         return _loc3_;
      }
      
      private function _1bV_() : String
      {
         return this._109 = this._109 || new LocalConnection().domain;
      }
   }
}
