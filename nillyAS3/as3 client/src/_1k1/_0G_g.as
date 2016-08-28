package _1k1
{
   import _P_S_.Mediator;
   import _v4.Client;
   import _0E_T_._1zi;
   import _lE_._0cw;
   import _3b.CloseDialogsSignal;
   import _0E_T_._0xK_;
   
   public class _0G_g extends Mediator
   {
       
      
      [Inject]
      public var view:_1k1.ReskinCharacterView;
      
      [Inject]
      public var player:Client;
      
      [Inject]
      public var model:_1zi;
      
      [Inject]
      public var _zX_:_0cw;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      private var _E_G_:_0xK_;
      
      public function _0G_g()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._E_G_ = this._14h();
         this.view.selected.add(this._1Q_3);
         this.view._1J_l.add(this._0kS_);
      }
      
      private function _14h() : _0xK_
      {
         return this.model._1H_j()._E_G_;
      }
      
      override public function destroy() : void
      {
         this.view.selected.remove(this._1Q_3);
         this.view._1J_l.remove(this._0kS_);
      }
      
      private function _1Q_3() : void
      {
         this.closeDialogs.dispatch();
         this._zX_.dispatch(this._E_G_._0sr());
      }
      
      private function _0kS_() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
