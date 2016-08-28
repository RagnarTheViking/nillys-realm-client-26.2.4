package com.company.assembleegameclient.map
{
   import _P_S_.Mediator;
   import _18._qP_;
   import _1xa._dU_;
   
   public class _1R_5 extends Mediator
   {
       
      
      [Inject]
      public var view:com.company.assembleegameclient.map.Map;
      
      [Inject]
      public var _nE_:com.company.assembleegameclient.map._1mU_;
      
      public function _1R_5()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._nE_.add(this._1cI_);
      }
      
      override public function destroy() : void
      {
         this._nE_.remove(this._1cI_);
      }
      
      private function _1cI_(param1:String, param2:uint) : void
      {
         this.view.player_ && this._1W_U_(param1,param2);
      }
      
      private function _1W_U_(param1:String, param2:uint) : void
      {
         var _loc3_:_qP_ = new _qP_(this.view.player_,new _dU_().setParams(param1),param2,2000,0);
         this.view.mapOverlay_.addQueuedText(_loc3_);
      }
   }
}
