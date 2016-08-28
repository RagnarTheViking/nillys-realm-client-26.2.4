package _A_4
{
   import _P_S_.Mediator;
   import _0E_T_._1zi;
   import _1to._08r;
   import _1to._0I_;
   import _0E_T_._Y_F_;
   
   public class _1dm extends Mediator
   {
       
      
      [Inject]
      public var view:_A_4.CharacterSkinListItem;
      
      [Inject]
      public var model:_1zi;
      
      [Inject]
      public var _02q:_08r;
      
      [Inject]
      public var _1no:_0I_;
      
      public function _1dm()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.buy.add(this._5k);
         this.view._nU_.add(this._G_H_);
         this.view.out.add(this._0A_4);
         this.view.selected.add(this._1Q_3);
      }
      
      override public function destroy() : void
      {
         this.view.buy.remove(this._5k);
         this.view._nU_.remove(this._G_H_);
         this.view.out.remove(this._0A_4);
         this.view.selected.remove(this._1Q_3);
         this.view._0P_L_(null);
      }
      
      private function _G_H_() : void
      {
         this._1no.dispatch(this.view._wU_());
      }
      
      private function _0A_4() : void
      {
         this._1no.dispatch(null);
      }
      
      private function _5k() : void
      {
         var _loc1_:_Y_F_ = this.view._wU_();
         this._02q.dispatch(_loc1_);
      }
      
      private function _1Q_3(param1:Boolean) : void
      {
         this.view._wU_()._u5(param1);
      }
   }
}
