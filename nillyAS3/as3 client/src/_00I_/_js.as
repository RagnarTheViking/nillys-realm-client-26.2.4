package _00I_
{
   import _P_S_.Mediator;
   import flash.net.navigateToURL;
   import flash.net.URLRequest;
   import flash.external.ExternalInterface;
   
   public class _js extends Mediator
   {
      
      private static const _0L_Q_:String = "rotmg.KabamDotComLib.getKabamGamePage";
      
      private static const _0F_v:String = "https://www.kabam.com";
      
      private static const TOP:String = "_top";
       
      
      [Inject]
      public var view:_00I_._0B_g;
      
      public function _js()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.close.addOnce(this._fH_);
      }
      
      private function _fH_() : void
      {
         navigateToURL(new URLRequest(this._uA_()),TOP);
      }
      
      private function _uA_() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = _0F_v;
         try
         {
            _loc1_ = ExternalInterface.call(_0L_Q_);
            if(_loc1_ && _loc1_.length)
            {
               _loc2_ = _loc1_;
            }
         }
         catch(error:Error)
         {
         }
         return _loc2_;
      }
   }
}
