package _12g
{
   import flash.display.DisplayObjectContainer;
   import flash.system.Capabilities;
   import flash.display.LoaderInfo;
   
   public class _1T_d
   {
      
      private static var platform:_12g._nA_;
       
      
      private const _0L_G_:String = "Desktop";
      
      [Inject]
      public var root:DisplayObjectContainer;
      
      public function _1T_d()
      {
         super();
      }
      
      public function _00B_() : Boolean
      {
         return Capabilities.playerType != this._0L_G_;
      }
      
      public function _W_G_() : Boolean
      {
         return Capabilities.playerType == this._0L_G_;
      }
      
      public function _0kT_() : _12g._nA_
      {
         return platform = platform || this._1J_U_();
      }
      
      private function _1J_U_() : _12g._nA_
      {
         var _loc1_:Object = LoaderInfo(this.root.stage.root.loaderInfo).parameters;
         if(this._zv(_loc1_))
         {
            return _12g._nA_._2__7;
         }
         if(this._1A_K_(_loc1_))
         {
            return _12g._nA_._0F_b;
         }
         if(this._1jW_(_loc1_))
         {
            return _12g._nA_._1H_4;
         }
         return _12g._nA_._lI_;
      }
      
      private function _zv(param1:Object) : Boolean
      {
         return param1.kongregate_api_path != null;
      }
      
      private function _1A_K_(param1:Object) : Boolean
      {
         return param1.steam_api_path != null;
      }
      
      private function _1jW_(param1:Object) : Boolean
      {
         return param1.kabam_signed_request != null;
      }
   }
}
