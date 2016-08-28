package _lE_
{
   import _3b.DialogSignal;
   import _0sm._1P_X_;
   import _v4.Client;
   import _0E_T_._1zi;
   import _A_4._1r;
   import _1k1.ReskinCharacterView;
   import flash.display.DisplayObject;
   import _0E_T_._0xK_;
   
   public class _1nk
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _12B_:_1P_X_;
      
      [Inject]
      public var player:Client;
      
      [Inject]
      public var model:_1zi;
      
      [Inject]
      public var factory:_1r;
      
      public function _1nk()
      {
         super();
      }
      
      public function execute() : void
      {
         this._12B_.dispatch();
         this._06Z_.dispatch(this._U_s());
      }
      
      private function _U_s() : ReskinCharacterView
      {
         var _loc1_:ReskinCharacterView = new ReskinCharacterView();
         _loc1_._0S_K_(this._10d());
         _loc1_.x = (800 - _loc1_.width) * 0.5;
         _loc1_.y = (600 - _loc1_._1F_h) * 0.5;
         return _loc1_;
      }
      
      private function _10d() : Vector.<DisplayObject>
      {
         var _loc1_:_0xK_ = this._14h();
         return this.factory.make(_loc1_);
      }
      
      private function _14h() : _0xK_
      {
         return this.model._1H_j()._E_G_;
      }
   }
}
