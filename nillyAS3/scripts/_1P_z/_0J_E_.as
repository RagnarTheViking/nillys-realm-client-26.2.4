package _1P_z
{
   import _14k._1dB_;
   import _009._1G_z;
   import flash.display.LoaderInfo;
   import _14k._1E_K_;
   import flash.net.LocalConnection;
   import flash.system.Capabilities;
   
   public class _0J_E_ implements _1dB_
   {
      
      private static const _0L_G_:String = "Desktop";
      
      private static const _1ue:String = _1G_z._06k(-387,-136);
      
      private static const _1g4:String = "realmofthemadgod.appspot.com";
      
      private static const _0mV_:String = "rotmgtesting.appspot.com";
      
      private static const _04k:String = _1G_z._06k(-386,-137);
      
      private static const ROTMG_TESTING2:String = "rotmgbbtesting.appspot.com";
      
      private static const _08k:String = "Production";
       
      
      [Inject]
      public var loaderInfo:LoaderInfo;
      
      [Inject]
      public var _fL_:_1P_z._6t;
      
      private var _1M_P_:Boolean = false;
      
      private var _1o__:_1E_K_;
      
      public function _0J_E_()
      {
         super();
      }
      
      public function _1P_Z_() : String
      {
         return "production".toLowerCase();
      }
      
      public function _1hs() : _1E_K_
      {
         this._1M_P_ || this._uK_();
         return this._1o__;
      }
      
      private function _uK_() : void
      {
         this._1M_P_ = true;
         this._1pH_(this._1P_Z_());
      }
      
      private function _1pH_(param1:String) : void
      {
         var _loc2_:LocalConnection = null;
         var _loc3_:Boolean = this._1yI_(param1);
         if(_loc3_)
         {
            _loc2_ = new LocalConnection();
            if(_loc2_.domain == _0mV_ || _loc2_.domain == _04k)
            {
               this._1o__ = _1E_K_._04W_;
            }
            else if(_loc2_.domain == ROTMG_TESTING2)
            {
               this._1o__ = _1E_K_.TESTING2;
            }
         }
         else
         {
            this._1o__ = this._fL_._1hs(param1);
         }
      }
      
      private function _1yI_(param1:String) : Boolean
      {
         return param1 == _1P_z._6t._099 && !this._0ku();
      }
      
      private function _0ku() : Boolean
      {
         return !!this._0m8()?Boolean(this._0qn()):Boolean(this._04Z_());
      }
      
      private function _0m8() : Boolean
      {
         return Capabilities.playerType == _0L_G_;
      }
      
      private function _0qn() : Boolean
      {
         var _loc1_:Object = this.loaderInfo.parameters;
         return _loc1_.deployment == _08k;
      }
      
      private function _04Z_() : Boolean
      {
         var _loc1_:LocalConnection = new LocalConnection();
         return _loc1_.domain == _1ue || _loc1_.domain == _1g4;
      }
   }
}
