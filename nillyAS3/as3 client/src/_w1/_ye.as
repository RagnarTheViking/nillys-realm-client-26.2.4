package _w1
{
   import _P_S_.Mediator;
   import _04e._05X_;
   import _v4.Client;
   import _0jo._1xX_;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import flash.display.Sprite;
   import _ge._1R_J_;
   
   public class _ye extends Mediator
   {
       
      
      [Inject]
      public var death:_05X_;
      
      [Inject]
      public var view:_w1.ResurrectionView;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _1M_n:_1xX_;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      public function _ye()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.closed.add(this._qN_);
         this.view._0C_Z_.add(this._0bs);
         this.view.init(this.death._1sw().background);
      }
      
      override public function destroy() : void
      {
         this.view._0C_Z_.remove(this._0bs);
         this.view.closed.remove(this._qN_);
      }
      
      private function _0bs(param1:Sprite) : void
      {
         this._06Z_.dispatch(param1);
      }
      
      private function _qN_() : void
      {
         this.closeDialogs.dispatch();
         var _loc1_:_1R_J_ = new _1R_J_();
         _loc1_._1F_H_ = false;
         _loc1_.charId = this._0U_H_._1U_H_;
         _loc1_._vt = true;
         this._1M_n.dispatch(_loc1_);
      }
   }
}
