package _bv
{
   import _P_S_.Mediator;
   import _0pn._1R_l;
   import _1E_7._00G_;
   import _1C_p._16E_;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import _1C_p._1E_X_;
   
   public class _00a extends Mediator
   {
       
      
      [Inject]
      public var view:_bv._aN_;
      
      [Inject]
      public var _0H_H_:_1R_l;
      
      [Inject]
      public var _W_:_00G_;
      
      public function _00a()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._0c__.add(this._qo);
      }
      
      override public function destroy() : void
      {
         this.view._0c__.remove(this._qo);
      }
      
      private function _qo(param1:_16E_) : void
      {
         var _loc2_:URLRequest = null;
         switch(param1.linkType)
         {
            case _1E_X_._1D_R_:
               _loc2_ = new URLRequest(param1.linkDetail);
               navigateToURL(_loc2_,"_blank");
               return;
            case _1E_X_._ea:
               this._0H_H_.dispatch(int(param1.linkDetail));
               return;
            case _1E_X_._d8:
               this._W_.dispatch(param1.linkDetail);
               return;
            default:
               return;
         }
      }
   }
}
